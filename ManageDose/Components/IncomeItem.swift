//
//  IncomeItem.swift
//  ManageDose
//
//  Created by RabiRabi Channel on 31/05/24.
//

import SwiftUI
import SwiftData

struct IncomeItem: View {
    
    var incomeData: IncomeData
    
    
    private var image: String {
        switch incomeData.categoryTransaction {
        case .salary:
            return "income"
        case .otherIncome:
            return "income"
        case .food:
            return "food"
        case .electricity:
            return "dailyneeds"
        case .investment:
            return "investment"
        case .retirement:
            return "retirement"
        case .entertainment:
            return "entertainment"
        case .shopping:
            return "shopping"
        }
    }

    
    var body: some View {
        HStack{
            Image("income")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(.yellow)
                .frame(height: 50)
            
            VStack(
                alignment: .leading
            ){
                Text(incomeData.name)
                    .fontWeight(.bold)
                    .font(.headline)
                Text(incomeData.categoryTransaction.rawValue)
                    .font(.subheadline)
          
            }
            
            Spacer()
            
            VStack(
                alignment: .trailing
            ){
        
                Text("+ Rp \(incomeData.amount,format: .number)")
                    .fontWeight(.bold)
                    .font(.headline)
                    .foregroundStyle(.green)
            

                Text(incomeData.date, style: .date)
                    .font(.subheadline)
            }
        }
        .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 0))
    }
}
