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
    
    @State private var selectedCategory: CategoryTransaction? = nil
    
    @Query(sort: \ExpenseData.date) var expenses: [ExpenseData]
    @Query(sort: \IncomeData.date) var incomes: [IncomeData]
    
    var body: some View {
        VStack{
            HStack{
                if UIDevice.current.userInterfaceIdiom == .pad {
                    Text("Transaction History")
                        .font(.title)
                        .fontWeight(.semibold)
                }else{
                    Text("Transaction History")
                        .font(.title3)
                        .fontWeight(.semibold)
                }
               
                Spacer()
                Text("Filter")
                    .font(.title3)
                    .foregroundStyle(.blue)
 
                Menu {
                    Button("All") {
                        selectedCategory = nil
                    }
                    ForEach(CategoryTransaction.allCases, id: \.self) { category in
                        Button(category.rawValue) {
                            selectedCategory = category
                        }
                    }
                } label: {
                    Image(systemName:"line.3.horizontal.decrease.circle")
                        .font(.title3)
                        .foregroundStyle(.blue)
                }
            }.padding(EdgeInsets(top: 80, leading: 20, bottom: 0, trailing: 20))
            ScrollView(.vertical, showsIndicators: false){
                LazyVStack{
                    ForEach(incomes.filter { selectedCategory == nil || $0.categoryTransaction == selectedCategory }) { incomes in
                        IncomeItem(incomeData: incomes )
                        SeparatorBar()
                    }
                    ForEach(expenses.filter { selectedCategory == nil || $0.categoryTransaction == selectedCategory }) { expense in
                        ExpenseItem(expenseData: expense )
                        SeparatorBar()
                    }
                }.padding(.horizontal)
            }.overlay{
                if expenses.isEmpty && incomes.isEmpty {
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
                            addExpensesSample()
                        }, label: {
                            Text("Add Transaction Sample")
                        })
                    }
                    
                }
                
            }
        }.ignoresSafeArea(.all)
    }
    
    
    private func addExpensesSample(){
        
        let data6 = ExpenseData(name: "Makan McD", date: Date(), amount: 60000, budget: .dailyneeds, categoryTransaction: .food)
        let data7 = ExpenseData(name: "Bayar Listrik", date: Date(), amount: 150000, budget: .saving, categoryTransaction: .electricity)
        let data8 = ExpenseData(name: "Gacoan", date: Date(), amount: 40000, budget: .saving, categoryTransaction: .food)
        
        modelContext.insert(data6)
        modelContext.insert(data7)
        modelContext.insert(data8)
    }
}

#Preview {
    TransactionHistoryView()
}
