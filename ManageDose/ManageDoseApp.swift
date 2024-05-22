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

    let container: ModelContainer = {
        let schema = Schema([TransactionData.self])
        let container = try! ModelContainer(for: schema, configurations: [])
        return container
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(container)
        .modelContainer(for: [TransactionData.self])
    }
}
