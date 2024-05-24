//
//  TransactionHistoryView.swift
//  ManageDose
//
//  Created by RabiRabi Channel on 20/05/24.
//

import SwiftUI
import SwiftData

struct TransactionHistoryView: View {
    
    @Query(sort: \TransactionData.date) var transactions: [TransactionData]
    
    var body: some View {
        VStack{
            HStack{
                Text("Transaction History")
                    .font(.title3)
                    .fontWeight(.semibold)
                Spacer()
                Text("Filter")
                    .font(.title3)
                    .foregroundStyle(.blue)
                Image(systemName:"line.3.horizontal.decrease.circle")
                    .font(.title3)
                    .foregroundStyle(.blue)
            }.padding()
            ScrollView(.vertical, showsIndicators: false){
                LazyVStack{
                    ForEach(transactions){ transaction in
                        TransactionItem(transactionData: TransactionData(id: "Strong", name: "McDonald's", date: Date(), amount: 109000, type: .expense, budget: .dailyneeds))
                        SeparatorBar()
                    }
                }.padding(.horizontal)
            }.overlay{
                if transactions.isEmpty {
                    VStack{
                        Image(systemName: "list.bullet.rectangle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 50)
                            .foregroundStyle(.gray)
                        Text("Add Transactions to see list")
                    }
                    
                }
            }
        }
    }
}

#Preview {
    TransactionHistoryView()
}
