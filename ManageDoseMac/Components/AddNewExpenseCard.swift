//
//  AddNewExpenseCard.swift
//  ManageDoseMac
//
//  Created by MacBook Pro on 06/06/24.
//

import SwiftUI

struct AddNewExpenseCard: View {
    
    let category : String
    
    var icon: String {
        switch category {
        case "Basic Needs":
            return "basic needs"
        case "Wants":
            return "wants"
        case "Savings":
            return "savings"
        default:
            return "basic needs"
        }
    }
    
    @State private var expenseName: String = ""
    @State private var expenseAmount: Double = 50000.0
    @State private var expenseDate: Date = Date()
    
    private var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = ""
        return formatter
    }
    
    var body: some View {
        VStack{
            
            
            VStack(alignment: .leading){
                Text("Add Expense")
                    .foregroundColor(Color.black)
                    .font(.title2)
                    .fontWeight(.bold)
                HStack{
                    Image(icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height:50)
                        .foregroundStyle(.blue)
                        .padding(EdgeInsets(top:0, leading:0, bottom: 10, trailing: 0))
                    VStack(alignment: .leading){
                        Text("Expense Category")
                            .foregroundColor(Color.black)
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .padding(.bottom, 4)
                        TextField("Food and Drink", text: $expenseName)
                            .font(.subheadline)
                            .foregroundColor(Color.black)
                            .foregroundStyle(.gray)
                            SeparatorBar()
                            .padding(.bottom, 8)
                    }
                }
            }
            .padding()
        }
        .background(Color.white)
    }
}

#Preview {
    AddNewExpenseCard(category: "Savings")
}
