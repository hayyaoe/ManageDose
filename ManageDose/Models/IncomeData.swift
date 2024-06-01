//
//  IncomeData.swift
//  ManageDose
//
//  Created by RabiRabi Channel on 31/05/24.
//

import Foundation
import SwiftData

@Model
class IncomeData: Identifiable{
    
    @Attribute(.unique) var id: String
    var name: String
    var date: Date
    var amount: Double
    var categoryTransaction: CategoryTransaction
    
    init( name: String, date: Date, amount: Double, category: Category) {
        self.id = UUID().uuidString
        self.name = name
        self.date = date
        self.amount = amount
        self.categoryTransaction = categoryTransaction
    }
}
