//
//  ExpenseData.swift
//  ManageDose
//
//  Created by RabiRabi Channel on 31/05/24.
//

import Foundation
import SwiftData

enum Category: String, Codable {
    
    case food = "Food"
    case electricity = "Electric Bill"
    
}

@Model
class ExpenseData: Identifiable{
    
    @Attribute(.unique) var id: String
    var name: String
    var date: Date
    var amount: Double
    var budget: Budget
    var category: Category
    
    init(id: String, name: String, date: Date, amount: Double, budget: Budget, category: Category) {
        self.id = id
        self.name = name
        self.date = date
        self.amount = amount
        self.budget = budget
        self.category = category
    }
    
}
