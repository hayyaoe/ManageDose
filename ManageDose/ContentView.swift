//
//  ContentView.swift
//  ManageDose
//
//  Created by RabiRabi Channel on 17/05/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false
    
    @State private var selectedTab = 1
    
    @Binding var incomes: [IncomeData]
    @Binding var expenses: [ExpenseData]
    @Binding var budgets: [BudgetingData]
    
    var body: some View {
        #if os(watchOS)
        let basicNeeds = budgets.first(where: { $0.budget == .dailyneeds })
        let savings = budgets.first(where: { $0.budget == .saving })
        let wants = budgets.first(where: { $0.budget == .wants })
        NavigationView {
            ZStack {
                Color.white
                    .ignoresSafeArea()
                    VStack {
                        Text("Budgeting")
                            .foregroundStyle(.black)
                            .font(.system(size: 16))
                            .offset(y: -25)
                        NavigationLink(destination: ExpendAllocationView(expenses: $expenses, budgets: $budgets, selectedTab: $selectedTab, budget: totalBudget()), label: {
                            PieChart(
                                basic: basicNeeds?.percentage ?? 0,
                                savings: savings?.percentage ?? 0,
                                wants: wants?.percentage ?? 0,
                                budget: totalBudget()
                            )
                        })
                    }
            }
        }
        #else
        if hasSeenOnboarding {
            TabView(selection: $selectedTab) {
                NavigationView {
                    Home(incomes: .constant(self.incomes), expenses: .constant(self.expenses), budgets: .constant(self.budgets), selectedTab: $selectedTab)
                }
                .tag(1)
                .tabItem {
                    Image(systemName: "house")
                        .imageScale(.large)
                        .foregroundStyle(Color(red: 83/255, green: 57/255, blue: 238/255, opacity: 1))
                }
                
                NavigationView {
                    BudgetingView(budgetings: .constant(self.budgets), selectedTab: $selectedTab, budget: totalBudget())
                }
                .tag(2)
                .tabItem {
                    Image(systemName: "newspaper")
                        .imageScale(.large)
                        .foregroundStyle(Color(red: 83/255, green: 57/255, blue: 238/255, opacity: 1))
                }
                
                NavigationView {
                    TransactionHistoryView()
                }
                .tag(3)
                .tabItem {
                    Image(systemName: "menucard")
                        .imageScale(.large)
                        .foregroundStyle(Color(red: 83/255, green: 57/255, blue: 238/255, opacity: 1))
                }
            }
        } else {
            OnBoarding1View()
        }
        #endif
    }
    
    private func availableBudget() -> Double {
        var cumulativeIncome = 0.0
        var cumulativeExpense = 0.0

        for income in incomes {
            cumulativeIncome += income.amount
        }

        for expense in expenses {
            cumulativeExpense += expense.amount
        }

        return cumulativeIncome - cumulativeExpense
    }
    
    private func totalBudget() -> Double {
        var cumulativeIncome = 0.0

        for income in incomes {
            cumulativeIncome += income.amount
        }

        return cumulativeIncome
    }
}

#Preview {
    do {
        let appGroupID = "group.com.hayyaoe.ManageDose"
        guard let sharedContainerURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: appGroupID) else {
            fatalError("Shared container could not be found.")
        }
        
//        let config = ModelConfiguration(url: sharedContainerURL)
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: BudgetingData.self, IncomeData.self, ExpenseData.self, configurations: config)
        let example = [
            BudgetingData(name: "Basic Needs", percentage: 50, budget: .dailyneeds, totalBudget: 3000000, used: 500),
            BudgetingData(name: "Wants", percentage: 30, budget: .wants, totalBudget: 3000000, used: 100000),
            BudgetingData(name: "Savings", percentage: 20, budget: .saving, totalBudget: 3000000, used: 500000)]
        
        let incomeExample = [IncomeData(name: "Salary", date: Date(), amount: 1000000, categoryTransaction: .salary), IncomeData(name: "Salary", date: Date(), amount: 1000000, categoryTransaction: .salary), IncomeData(name: "Salary", date: Date(), amount: 1000000, categoryTransaction: .salary)]
        
        let expenseExample = [ExpenseData(name: "Salary", date: Date(), amount: 1000000, budget: .wants, categoryTransaction: .salary)]
        
        @State var budgetings = example
        @State var incomes = incomeExample
        @State var expenses = expenseExample
        
        return ContentView(incomes: $incomes, expenses: $expenses, budgets: $budgetings)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
