//
//  TransactionHistoryView.swift
//  ManageDose
//
//  Created by RabiRabi Channel on 20/05/24.
//

import SwiftUI
import SwiftData

struct TransactionHistoryView: View {
    
    @Environment(\.modelContext) var modelContext
    
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
                        TransactionItem(transactionData: TransactionData(id: "Strong", name: "McDonald's", date: Date(), amount: 109000, cashFlow: .expense, budget: .dailyneeds, category: "Halo"))
                        SeparatorBar()
                    }
                }.padding(.horizontal)
            }.overlay{
                if transactions.isEmpty {
                    VStack{
                        Image(systemName: "list.bullet.rectangle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 40)
                            .foregroundStyle(.gray)
                            .padding(4)
                        Text("Add Transactions to see list")
                            .foregroundStyle(.gray)
                        Button(action: {
                            addTransactionSample()
                        }, label: {
                            Text("Add Transaction Sample")
                        })
                    }
                    
                }
            }
        }
    }
    
    func addTransactionSample (){
        
        let data4 = TransactionData(id: "BUDI", name: "XX1", date: Date(), amount: 20000, cashFlow: .expense, budget: .dailyneeds, category: .electricity)
        let data5 = TransactionData(id: "GAMING", name: "XX2", date: Date(), amount: 20000, cashFlow: .income, budget: .wants, category: .food)
        let data6 = TransactionData(id: "YEE", name: "XX3", date: Date(), amount: 20000, cashFlow: .expense, budget: .saving, category: .electricity)
        
        modelContext.insert(data4)
        modelContext.insert(data5)
        modelContext.insert(data6)
    }
}

#Preview {
    TransactionHistoryView()
}
