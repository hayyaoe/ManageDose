//
//  BudgetingData.swift
//  ManageDose
//
//  Created by RabiRabi Channel on 21/05/24.
//

import Foundation
import SwiftData

enum Budget: String, Codable, CaseIterable{
    
    case saving = "Savings"
    case dailyneeds = "Daily Needs"
    case wants = "Wants"
    
}

@Model
class BudgetingData: Identifiable{
    
    @Attribute(.unique) var id: String
    var name: String
    var percentage: Double
    var budget: Budget

    init(name: String, percentage: Double, budget: Budget) {
        self.id = UUID().uuidString
        self.name = name
        self.percentage = percentage
        self.budget = budget
    }
    
}
