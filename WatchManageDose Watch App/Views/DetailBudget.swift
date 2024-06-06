//
//  DetailBudget.swift
//  WatchManageDose Watch App
//
//  Created by MacBook Pro on 06/06/24.
//

import SwiftUI
import SwiftData

struct DetailBudget: View {
    @Environment(\.modelContext) private var context
    @Binding var expenses: [ExpenseData]
    @Binding var budgeting: BudgetingData
    
    var body: some View {
        ZStack{
            Color.white
                .ignoresSafeArea()
            VStack {
                Text("Expend Allocation")
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    .font(.system(size: 16))
                ScrollView(.vertical, showsIndicators: false) {
                    if expenses.filter({ $0.budget.rawValue == budgeting.budget.rawValue }).isEmpty {
                            Text("No expenses found")
                                .foregroundColor(.gray)
                                .font(.system(size: 14))
                                .padding()
                    } else {
                        LazyVStack {
                            ForEach(expenses.filter { $0.budget.rawValue == budgeting.budget.rawValue }) { expense in
                                ExpenseCard(
                                    expenseName: expense.name,
                                    expenseCategory: expense.categoryTransaction,
                                    expenseAmount: expense.amount,
                                    expenseDate: expense.date,
                                    budgetCategory: expense.budget
                                )
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle(
            Text("Detail Budget")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundStyle(.blue)
        )
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: BudgetingData.self, ExpenseData.self, configurations: config)
        let exampleBudget = BudgetingData(name: "Basic Needs", percentage: 50, budget: .dailyneeds, totalBudget: 3000000, used: 500)
        let exampleExpenses = [
            ExpenseData(name: "Expense 1", date: Date(), amount: 10000, budget: .dailyneeds, categoryTransaction: .food),
            ExpenseData(name: "Expense 2", date: Date(), amount: 20000, budget: .dailyneeds, categoryTransaction: .electricity),
            ExpenseData(name: "Expense 2", date: Date(), amount: 20000, budget: .dailyneeds, categoryTransaction: .electricity),
            ExpenseData(name: "Expense 2", date: Date(), amount: 20000, budget: .dailyneeds, categoryTransaction: .electricity),
            ExpenseData(name: "Expense 2", date: Date(), amount: 20000, budget: .dailyneeds, categoryTransaction: .electricity)
            
        ]
        
        @State var budget = exampleBudget
        @State var expenses = exampleExpenses
        
        return DetailBudget(expenses: $expenses, budgeting: $budget)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
