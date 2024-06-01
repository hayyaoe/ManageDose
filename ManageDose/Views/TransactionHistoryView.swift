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
    
//    @State private var filter: String
    
    @Query(sort: \ExpenseData.date) var expenses: [ExpenseData]
    
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
                    ForEach(expenses){ expense in
                        ExpenseItem(expenseData: expense )
                        SeparatorBar()
                    }
                }.padding(.horizontal)
            }.overlay{
                if expenses.isEmpty {
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
                            addExpenseSample()
                        }, label: {
                            Text("Add Transaction Sample")
                        })
                    }
                    
                }
            }
        }
    }
    
    
    func addExpenseSample(){
        
        let data6 = ExpenseData(name: "Gaji", date: Date(), amount: 20000000, budget: .dailyneeds, category: .electricity)
        let data7 = ExpenseData(name: "Gaji", date: Date(), amount: 20000000, budget: .saving, category: .electricity)
        let data8 = ExpenseData(name: "Gaji", date: Date(), amount: 20000000, budget: .saving, category: .electricity)
        
        modelContext.insert(data6)
        modelContext.insert(data7)
        modelContext.insert(data8)
    }
}

#Preview {
    TransactionHistoryView()
}
