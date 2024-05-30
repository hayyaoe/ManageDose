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

    let transactionContainer = try! ModelContainer(for: TransactionData.self)
    let budgetContainer = try! ModelContainer(for: BudgetingData.self)

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(transactionContainer)
        .modelContainer(budgetContainer)
        .modelContainer(for: [TransactionData.self])
        .modelContainer(for: [BudgetingData.self])
    }
}
