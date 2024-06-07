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
    @Binding var budget: Double
    
    var body: some View {
        VStack(alignment: .leading){
            if UIDevice.current.userInterfaceIdiom == .pad{
                VStack (spacing: 15){
                    SettingBudgetItem(percentage: Int(basicNeedsPercentage), name: "Basic Needs", amount: Int(budget)*Int(basicNeedsPercentage)/100)
                    SettingBudgetItem(percentage: Int(savingsPercentage), name: "Savings", amount: Int(budget)*Int(savingsPercentage)/100)
                    SettingBudgetItem(percentage: Int(wantsPercentage), name: "Wants", amount: Int(budget)*Int(wantsPercentage)/100)
                }
            }else{
                HStack (spacing: 15){
                    SettingBudgetItem(percentage: Int(basicNeedsPercentage), name: "Basic Needs", amount: Int(budget)*Int(basicNeedsPercentage)/100)
                    SettingBudgetItem(percentage: Int(savingsPercentage), name: "Savings", amount: Int(budget)*Int(savingsPercentage)/100)
                }
                .frame(width: .infinity)
                
                Spacer().frame(height: 14)
                
                
                SettingBudgetItem(percentage: Int(wantsPercentage), name: "Wants", amount: Int(budget)*Int(wantsPercentage)/100)
            }
            
        }
    }
}

#Preview {
    SettingBudgetRow(basicNeedsPercentage: .constant(50), wantsPercentage: .constant(30), savingsPercentage: .constant(20), budget: .constant(2000000))
}
