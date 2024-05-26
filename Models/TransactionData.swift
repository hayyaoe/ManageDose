//
//  TransactionData.swift
//  ManageDose
//
//  Created by RabiRabi Channel on 21/05/24.
//

import Foundation
import SwiftData

enum CashFlow: String, Codable {
    case income = "Income"
    case expense = "Expense"
}

@Model
class TransactionData{
    @Attribute(.unique) var id: String
    var name: String
    var date: Date
    var amount: Double
    var cashFlow: CashFlow
    var budget: Budget
    
    init(id: String, name: String, date: Date, amount: Double, cashFlow: CashFlow, budget: Budget) {
        self.id = id
        self.name = name
        self.date = date
        self.amount = amount
        self.cashFlow = cashFlow
        self.budget = budget
    }
}
