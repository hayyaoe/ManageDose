//
//  BudgetingCard.swift
//  ManageDose
//
//  Created by RabiRabi Channel on 20/05/24.
//

import SwiftUI

struct BudgetingCard: View {
    
    var budgetingData: BudgetingData
    var budgetAvailable: Double
    var expenseData: [ExpenseData] = []
    
    private var imageColor: String {
        switch budgetingData.budget {
        case .dailyneeds:
            return "food"
        case .wants:
            return "dailyneeds"
        case .saving:
            return "savings"
        }
    }
    
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 4
        ){
            Image(imageColor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height:60)
                .padding(EdgeInsets(top:0, leading:0, bottom: 10, trailing: 0))
            Text(budgetingData.name)
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundStyle(.gray)
            Text("Rp \((budgetingData.percentage * budgetAvailable) - calculateUsage(), format: .number)")
                .fontWeight(.bold)
                .font(.subheadline)
                .truncationMode(.tail)
                .lineLimit(1)
        }
        .frame(width: 110, height: 110)
        .padding(15)
        .background(Color.white)
        .cornerRadius(18)
        .shadow(color: Color.black.opacity(0.15), radius: 4, x: 0, y: 0)
        
    }
    
        
        private func calculateUsage() -> Double {
          expenseData.filter { $0.budget == budgetingData.budget }
                    .reduce(0.0, { $0 + $1.amount })
        }
        
}

struct BudgetingCard_Preview: PreviewProvider {
    static var previews: some View {
        let budgetingData = BudgetingData( name: "Name", percentage: 0.7, budget: .dailyneeds )
        BudgetingCard(budgetingData: budgetingData, budgetAvailable: 100000000)
    }
}

//#Preview{
//    BudgetingCard()
//}

