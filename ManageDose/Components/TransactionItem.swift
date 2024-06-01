//
//  TransactionItem.swift
//  ManageDose
//
//  Created by RabiRabi Channel on 20/05/24.
//

import SwiftUI

struct TransactionItem: View {
    var transactionData: TransactionData
    
    var body: some View {
        HStack{
            Image(systemName: "tag.square")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(.yellow)
                .frame(height: 50)
            
            VStack(
                alignment: .leading
            ){
                Text(transactionData.name)
                    .fontWeight(.bold)
                    .font(.headline)
                Text(transactionData.budget.rawValue)
                    .font(.subheadline)
          
            }
            
            Spacer()
            
            VStack(
                alignment: .trailing
            ){
                if transactionData.cashFlow == .expense {
                    Text(String(format: "- Rp. %.2f", transactionData.amount))
                        .fontWeight(.bold)
                        .font(.headline)
                        .foregroundStyle(.red)
                }else{
                    Text(String(format: "+ Rp. %.2f", transactionData.amount))
                        .fontWeight(.bold)
                        .font(.headline)
                        .foregroundStyle(.green)
                }

                Text(transactionData.date, style: .date)
                    .font(.subheadline)
            }
        }
        .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 0))
    }
}

struct TransactionItem_Preview: PreviewProvider {
    static var previews: some View {
        let transaction = TransactionData(id: "Nice", name: "ChiFry", date: Date(), amount: 69420, cashFlow: .income, budget: .dailyneeds, category: "Halo")
        TransactionItem(transactionData: transaction)
    }
}
