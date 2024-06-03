//
//  ContentView.swift
//  ManageDose
//
//  Created by RabiRabi Channel on 17/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            SettingBudget(budget: 3000000, budgetings: [
                BudgetingData( name: "Basic Needs", percentage: 50, budget: .dailyneeds),
                BudgetingData( name: "Savings", percentage: 20, budget: .saving),
                BudgetingData(name: "Wants", percentage: 30, budget: .wants)
            ], isPreview: true)
        }

    }
}

#Preview {
    ContentView()
}
