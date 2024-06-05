//
//  ContentView.swift
//  ManageDose
//
//  Created by RabiRabi Channel on 17/05/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false
    
    @State private var selectedTab = 1
    
    @Query var incomes: [IncomeData]
    @Query var expenses: [ExpenseData]
    @Query var budgets: [BudgetingData]
    
    var body: some View {
        if hasSeenOnboarding {
            TabView(selection: $selectedTab ,content: {
                NavigationView(content: {
                Home(incomes: .constant(self.incomes), expenses: .constant(self.expenses), budgets: .constant(self.budgets), selectedTab: $selectedTab)
                })
                    .tag(1)
                    .tabItem{
                        Image(systemName: "house")
                                .imageScale(.large)
                                .foregroundStyle(Color(red: 83/255, green: 57/255, blue: 238/255, opacity: 1))
                    }
                
                NavigationView(content: {
                BudgetingView(budgetings: .constant(self.budgets), selectedTab: $selectedTab, budget: availableBudget())
                })
                    .tag(2)
                    .tabItem { 
                        Image(systemName: "newspaper")
                            .imageScale(.large)
                            .foregroundStyle(Color(red: 83/255, green: 57/255, blue: 238/255, opacity: 1))
                    }
                
                
                NavigationView(content: {
                TransactionHistoryView()
                })
                    .tag(3)
                    .tabItem {
                        Image(systemName: "menucard")
                                .imageScale(.large)
                                .foregroundStyle(Color(red: 83/255, green: 57/255, blue: 238/255, opacity: 1))
                    }
                
            })

        }else{
            OnBoarding1View()
        }
        

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
}

#Preview {
    ContentView()
}
