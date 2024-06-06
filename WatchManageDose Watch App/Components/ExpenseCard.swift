//
//  ExpenseCard.swift
//  WatchManageDose Watch App
//
//  Created by MacBook Pro on 06/06/24.
//

import SwiftUI

struct ExpenseCard: View {
    let expenseName: String
    let expenseCategory: CategoryTransaction
    let expenseAmount: Double
    let expenseDate: Date
    let budgetCategory: Budget
    
    var icon: String {
        switch budgetCategory {
        case .saving:
            return "savings"
        case .dailyneeds:
            return "basic needs"
        case .wants:
            return "wants"
        }
    }

    var body: some View {
        HStack {
            Image(icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(.yellow)
                .frame(height: 30)
                .padding(.trailing, 2) // Add padding to the trailing edge
            
            VStack(alignment: .leading) {
                Text(expenseName)
                    .fontWeight(.bold)
                    .font(.system(size: 12))
                    .lineLimit(1)
                    .foregroundStyle(.black)
                Text(expenseCategory.rawValue)
                    .font(.system(size: 10))
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("Rp. \(expenseAmount, format: .number)")
                    .font(.system(size: 10))
                    .fontWeight(.bold)
                    .foregroundStyle(.red) // Ensure text color is contrasting
                Text(expenseDate, style: .date)
                    .font(.system(size: 10))
                    .foregroundStyle(.gray)
            }
        }
        .padding(10)
        .background(Color.white)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(red: 211/255, green: 209/255, blue: 209/255, opacity: 1), lineWidth: 1)
        )
        
    }
}

#Preview {
    ExpenseCard(expenseName: "McDonald's", expenseCategory: .electricity, expenseAmount: 10000, expenseDate: Date(), budgetCategory: .dailyneeds)
}
