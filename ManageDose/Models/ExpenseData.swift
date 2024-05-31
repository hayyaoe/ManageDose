//
//  ExpenseData.swift
//  ManageDose
//
//  Created by RabiRabi Channel on 31/05/24.
//

import Foundation
import SwiftData

enum CategoryTransaction: String, Codable {
    case food = "Food"
    case electricity = "Electric Bill"
    case salary = "Salary"
    case otherIncome = "Other Income"
}

@Model
class ExpenseData: Identifiable{
    
    @Attribute(.unique) var id: String
    var name: String
    var date: Date
    var amount: Double
    var budget: Budget
    var categoryTransaction: CategoryTransaction
    
    init(id: String, name: String, date: Date, amount: Double, budget: Budget, category: CategoryTransaction) {
        self.id = id
        self.name = name
        self.date = date
        self.amount = amount
        self.budget = budget
        self.categoryTransaction = category
    }
    
}
