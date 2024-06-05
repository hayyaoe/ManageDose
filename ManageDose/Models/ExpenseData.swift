//
//  ExpenseData.swift
//  ManageDose
//
//  Created by RabiRabi Channel on 31/05/24.
//

import Foundation
import SwiftData

enum CategoryTransaction: String, Codable{
    case food = "Food"
    case electricity = "Electric Bill"
    case salary = "Salary"
    case otherIncome = "Other Income"
    case investment = "Investment"
    case retirement = "Retirement"
    case entertainment = "Entertainment"
    case shopping = "Shopping"
    
    static var allCases: [CategoryTransaction] {
        return [.food, .electricity, .salary, .otherIncome, .entertainment, .retirement, .shopping, .investment]
    }
}

@Model
class ExpenseData: Identifiable{
    
    @Attribute(.unique) var id: String
    var name: String
    var date: Date
    var amount: Double
    var budget: Budget
    var categoryTransaction: CategoryTransaction
  
    init(name: String, date: Date, amount: Double, budget: Budget, categoryTransaction: CategoryTransaction) {
        self.id = UUID().uuidString
        self.name = name
        self.date = date
        self.amount = amount
        self.budget = budget
        self.categoryTransaction = categoryTransaction
    }
    
}
