//
//  ExpendAllocationView.swift
//  WatchManageDose Watch App
//
//  Created by MacBook Pro on 06/06/24.
//

import SwiftUI
import SwiftData

struct ExpendAllocationView: View {
    @Environment(\.modelContext) var modelContext
    @Binding var expenses: [ExpenseData]
    @Binding var budgets: [BudgetingData]
    @Binding var selectedTab: Int
    
    var budget: Double
    
    var body: some View {
        let basicNeeds = budgets.first(where: { $0.budget == .dailyneeds })
        let savings = budgets.first(where: { $0.budget == .saving })
        let wants = budgets.first(where: { $0.budget == .wants })
        
        ZStack{
            Color.white
                .ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: false) {
                HStack {
                    Text("Expend Allocation")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                        .font(.system(size: 16))
                }
                LazyVStack(spacing: -10) {
                    if let basicNeeds = basicNeeds {
                        NavigationLink(destination: DetailBudget(expenses: $expenses, budgeting: Binding(get: { basicNeeds }, set: { _ in }))) {
                            BudgetProgressCard(budget: basicNeeds.amount, used: basicNeeds.used, name: "Basic Needs")
                        }
                    }
                    if let wants = wants {
                        NavigationLink(destination: DetailBudget(expenses: $expenses, budgeting: Binding(get: { wants }, set: { _ in }))) {
                            BudgetProgressCard(budget: wants.amount, used: wants.used, name: "Wants")
                        }
                    }
                    if let savings = savings {
                        NavigationLink(destination: DetailBudget(expenses: $expenses, budgeting: Binding(get: { savings }, set: { _ in }))) {
                            BudgetProgressCard(budget: savings.amount, used: savings.used, name: "Savings")
                        }
                    }
                }
//                .padding(.top, -35)
                
            }
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: BudgetingData.self, configurations: config)
        let example = [
            BudgetingData(name: "Basic Needs", percentage: 50, budget: .dailyneeds, totalBudget: 3000000, used: 500),
            BudgetingData(name: "Wants", percentage: 30, budget: .wants, totalBudget: 3000000, used: 100000),
            BudgetingData(name: "Savings", percentage: 20, budget: .saving, totalBudget: 3000000, used: 500000)
        ]
        let example2 = [
            ExpenseData(name: "Salary", date: Date(), amount: 1000000, budget: .wants, categoryTransaction: .salary),
            ExpenseData(name: "Salary", date: Date(), amount: 1000000, budget: .wants, categoryTransaction: .salary)
        ]
        
        @State var budgetings = example
        @State var expenses = example2
        @State var selectedTab = 1
        
        return ExpendAllocationView(expenses: $expenses, budgets: $budgetings, selectedTab: $selectedTab, budget: 3000000)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
