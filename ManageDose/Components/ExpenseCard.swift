//
//  ExpenseCard.swift
//  ManageDose
//
//  Created by MacBook Pro on 25/05/24.
//

import SwiftUI

struct ExpenseCard: View {
    let expenseName: String
    let expenseCategory: CategoryTransaction
    let expenseAmount: Double
    let expenseDate: Date
    let budgetCatefory: Budget
    
    var icon: String {
        switch budgetCatefory {
        case .saving:
            return "savings"
        case .dailyneeds:
            return "basic needs"
        case .wants:
            return "wants"
        }
    }
    
    

    var body: some View {
        if UIDevice.current.userInterfaceIdiom == .pad{
            HStack {
                HStack {
                    Image(icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(.yellow)
                        .frame(height: 70)
                    
                    VStack(alignment: .leading) {
                        Text(expenseName)
                            .fontWeight(.bold)
                            .font(.title2)
                        Text(expenseCategory.rawValue)
                            .font(.title3)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text("- Rp. \(String(format: "%.2f", expenseAmount))")
                            .fontWeight(.bold)
                            .font(.title2)
                            .foregroundStyle(.red)
                        Text(expenseDate, style: .date)
                            .font(.title3)
                    }
                }
                .background(Color.white)
                .padding(15)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 211/255, green: 209/255, blue: 209/255, opacity: 1), lineWidth: 1)
                )
            }
            .padding(.top, 10)
        }else{
            HStack {
                HStack {
                    Image(icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(.yellow)
                        .frame(height: 50)
                    
                    VStack(alignment: .leading) {
                        Text(expenseName)
                            .fontWeight(.bold)
                            .font(.headline)
                        Text(expenseCategory.rawValue)
                            .font(.subheadline)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text("- Rp. \(String(format: "%.2f", expenseAmount))")
                            .fontWeight(.bold)
                            .font(.headline)
                            .foregroundStyle(.red)
                        Text(expenseDate, style: .date)
                            .font(.subheadline)
                    }
                }
                .background(Color.white)
                .padding(15)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 211/255, green: 209/255, blue: 209/255, opacity: 1), lineWidth: 1)
                )
            }
            .padding(.top, 10)
        }
        
    }
}

#Preview {
    ExpenseCard(expenseName: "McDonad's", expenseCategory: .electricity, expenseAmount: 69.42, expenseDate: Date(), budgetCatefory: .dailyneeds)
}

