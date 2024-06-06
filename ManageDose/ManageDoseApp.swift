//
//  ManageDoseApp.swift
//  ManageDose
//
//  Created by RabiRabi Channel on 17/05/24.
//

import SwiftUI
import SwiftData

class ModelContainerWrapper: ObservableObject {
    @Published var container: ModelContainer
    
    init() {
        // Define the shared container URL using the App Group identifier
        let appGroupIdentifier = "group.com.hayyaoe.ManageDose"
        guard let sharedContainerURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: appGroupIdentifier) else {
            fatalError("Shared container URL not found.")
        }
        
        // Create a ModelConfiguration with the shared container URL
        let config = ModelConfiguration(url: sharedContainerURL)
        
        // Create the ModelContainer with the specified configurations and model types
        do {
            self.container = try ModelContainer(for: TransactionData.self, BudgetingData.self, IncomeData.self, ExpenseData.self, configurations: config)
        } catch {
            fatalError("Failed to create model container: \(error)")
        }
    }
}

//@main
//struct ManageDoseApp: App {
//    
//    @StateObject var modelContainerWrapper = ModelContainerWrapper()
//    
//    var body: some Scene {
//        WindowGroup {
//            SplashScreen()
//        }
//        .environmentObject(modelContainerWrapper)
//    }
//}

@main
struct ManageDoseApp: App {
    
    var body: some Scene {
        WindowGroup {
            SplashScreen()
        }.modelContainer(for: [TransactionData.self, BudgetingData.self, IncomeData.self, ExpenseData.self])
    }
}


