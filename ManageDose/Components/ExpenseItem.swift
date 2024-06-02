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
    
    private var image: String {
        switch expenseData.categoryTransaction {
        case .salary:
            return "savings"
        case .otherIncome:
            return "savings"
        case .food:
            return "food"
        case .electricity:
            return "dailyneeds"
        }
    }

    
    var body: some View {
        HStack{
            Image(image)
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
                Text(expenseData.categoryTransaction.rawValue)
                    .font(.subheadline)
          
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
            }
        }
        .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 0))
    }
}
