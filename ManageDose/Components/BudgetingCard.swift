//
//  BudgetingCard.swift
//  ManageDose
//
//  Created by RabiRabi Channel on 20/05/24.
//

import SwiftUI

struct BudgetingCard: View {
    
//    var budgetingData: BudgetingData
    
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 4
        ){
            Image(systemName: "checkmark.square.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height:60)
                .foregroundStyle(.blue)
                .padding(EdgeInsets(top:0, leading:0, bottom: 10, trailing: 0))
            Text("")
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundStyle(.gray)
            Text("")
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
}

//struct BudgetingCard_Preview: PreviewProvider {
//    static var previews: some View {
//        let budgetingData = BudgetingData(id: "Budget A", name: Budget.dailyneeds.rawValue, percentage: 0.7, budget: .dailyneeds)
//        BudgetingCard(budgetingData: budgetingData)
//    }
//}

#Preview{
    BudgetingCard()
}

