//
//  BudgetingData.swift
//  ManageDose
//
//  Created by RabiRabi Channel on 21/05/24.
//

import Foundation
import SwiftData

enum Budget: Codable {
    case saving
    case dailyneeds
    case wants
}

@Model
class BudgetingData{
    @Attribute(.unique) var id: String
    var name: String
    var percentage: Double
    var budget: Budget
    
    init(id: String, name: String, percentage: Double, budget: Budget) {
        self.id = id
        self.name = name
        self.percentage = percentage
        self.budget = budget
    }
}
