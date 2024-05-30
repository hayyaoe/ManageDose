//
//  BudgetingData.swift
//  ManageDose
//
//  Created by RabiRabi Channel on 21/05/24.
//

import Foundation
import SwiftData

enum Budget: String, Codable{
    
    case saving = "Savings"
    case dailyneeds = "Daily Needs"
    case wants = "Wants"
    
}


enum Category: String, Codable {
    
    case food = "Food"
    case electricity = "Electric Bill"
    
}

@Model
class BudgetingData: Identifiable{
    
    @Attribute(.unique) var id: String
    var name: String
    var percentage: Double
    var budget: Budget
    var category: Category
    
    init(id: String, name: String, percentage: Double, budget: Budget, category: Category) {
        
        self.id = id
        self.name = name
        self.percentage = percentage
        self.budget = budget
        self.category = category
        
    }
    
}
