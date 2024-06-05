//
//  ManageDoseApp.swift
//  ManageDose
//
//  Created by RabiRabi Channel on 17/05/24.
//

import SwiftUI
import SwiftData

@main
struct ManageDoseApp: App {
    
    var body: some Scene {
        WindowGroup {
            SplashScreen()
        }.modelContainer(for: [TransactionData.self, BudgetingData.self, IncomeData.self, ExpenseData.self])
    }
}


