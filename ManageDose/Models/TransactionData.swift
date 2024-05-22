//
//  TransactionData.swift
//  ManageDose
//
//  Created by RabiRabi Channel on 21/05/24.
//

import Foundation
import SwiftData

enum Type: Codable {
    case income
    case expense
}

@Model
class TransactionData{
    @Attribute(.unique) var id: String
    var name: String
    var date: Date
    var amount: Double
    var type: Type
    var budget: Budget
    
    init(id: String, name: String, date: Date, amount: Double, type: Type, budget: Budget) {
        self.id = id
        self.name = name
        self.date = date
        self.amount = amount
        self.type = type
        self.budget = budget
    }
}
