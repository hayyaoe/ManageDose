//
//  SettingBudgetRow.swift
//  ManageDose
//
//  Created by MacBook Pro on 24/05/24.
//

import SwiftUI

struct SettingBudgetRow: View {
    @Binding var basicNeedsPercentage: CGFloat
    @Binding var wantsPercentage: CGFloat
    @Binding var savingsPercentage: CGFloat
    @Binding var budget: Int
    
    var body: some View {
        VStack(alignment: .leading){
            HStack (spacing: 10){
                SettingBudgetItem(percentage: Int(basicNeedsPercentage), name: "Basic Needs", amount: budget*Int(basicNeedsPercentage)/100)
                SettingBudgetItem(percentage: Int(wantsPercentage), name: "Wants", amount: budget*Int(wantsPercentage)/100)
            }
            .frame(width: .infinity)
            SettingBudgetItem(percentage: Int(savingsPercentage), name: "Savings", amount: budget*Int(savingsPercentage)/100)
        }
    }
}

#Preview {
    SettingBudgetRow(basicNeedsPercentage: .constant(50), wantsPercentage: .constant(30), savingsPercentage: .constant(20), budget: .constant(2000000))
}
