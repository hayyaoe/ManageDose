//
//  ExpenseItem.swift
//  ManageDose
//
//  Created by RabiRabi Channel on 31/05/24.
//

import SwiftUI
import SwiftData

struct ExpenseItem: View {
    
    var expenseData: ExpenseData
    
    private var icon: String {
        switch expenseData.budget {
        case .saving:
            return "savings"
        case .dailyneeds:
            return "basic needs"
        case .wants:
            return "wants"
        }
    }

    
    var body: some View {
        HStack{
            Image(icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(.yellow)
                .frame(height: 50)
            
            VStack(
                alignment: .leading
            ){
                Text(expenseData.name)
                    .fontWeight(.bold)
                    .font(.headline)
                    .foregroundColor(.black)
                Text(expenseData.categoryTransaction.rawValue)
                    .font(.subheadline)
                    .foregroundColor(.black)
          
            }
            
            Spacer()
            
            VStack(
                alignment: .trailing
            ){
        
                Text("- Rp \(expenseData.amount,format: .number)")
                    .fontWeight(.bold)
                    .font(.headline)
                    .foregroundStyle(.red)
            

                Text(expenseData.date, style: .date)
                    .font(.subheadline)
                    .foregroundColor(.black)
            }
        }
        .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 0))
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: ExpenseData.self, configurations: config)
        
        let exampleExpense = ExpenseData(
            name: "Monthly Salary",
            date: Date(),
            amount: 5000000,
            budget: .dailyneeds,
            categoryTransaction: .entertainment
        )
        
        return ExpenseItem(expenseData: exampleExpense)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
