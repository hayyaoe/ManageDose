//
//  DetailBudget.swift
//  ManageDose
//
//  Created by MacBook Pro on 25/05/24.
//

import SwiftUI
import SwiftData

struct DetailBudget: View {
    @Environment(\.modelContext) private var context
    @Query private var expenses: [ExpenseData]
    @Binding var budgeting: BudgetingData
    @State private var showSheet = false
    @State private var allFieldsFilled = false
    
    var body: some View {
        VStack {
            BudgetProgressCard(budget: budgeting.amount, used: budgeting.used, name: budgeting.name)
                .padding(.top, 10)
            Rectangle()
                .fill(Color(red: 220/255, green: 213/255, blue: 255/255, opacity: 1))
                .frame(width: 500, height: 20)
                .padding(10)
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack {
                    ForEach(expenses.filter { $0.budget.rawValue == budgeting.budget.rawValue }) { expense in
                        ExpenseCard(
                            expenseName: expense.name,
                            expenseCategory: expense.categoryTransaction,
                            expenseAmount: expense.amount,
                            expenseDate: expense.date,
                            budgetCatefory: expense.budget
                        )
                    }
                }
            }
            .overlay(
                HStack {
                    Spacer()
                    Button(action: {
                        showSheet.toggle()
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color(red: 83/255, green: 57/255, blue: 238/255, opacity: 1))
                                .frame(width: 60, height: 60)
                            Image(systemName: "plus")
                                .font(.title)
                                .foregroundColor(.white)
                        }
                    }
                }
                .offset(x: -10, y: 150)
            )
        }
        .padding(.horizontal, 15)
        .navigationBarTitle(
            Text("Detail Budget")
                .font(.title3)
                .fontWeight(.semibold),
            displayMode: .inline
        )
        .sheet(isPresented: $showSheet) {
            AddNewExpenseCard(
                allFieldsFilled: $allFieldsFilled,
                budgeting: $budgeting,
                isIncome: false,
                category: budgeting.name
            )
            .presentationDetents([.height(420)])
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: BudgetingData.self, ExpenseData.self, configurations: config)
        let example = BudgetingData(name: "Basic Needs", percentage: 50, budget: .dailyneeds, totalBudget: 3000000, used: 500)
        
        @State var budgetings = example
        
        return DetailBudget(budgeting: $budgetings)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
