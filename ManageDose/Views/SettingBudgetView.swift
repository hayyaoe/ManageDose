//
//  SettingBudget.swift
//  ManageDose
//
//  Created by MacBook Pro on 24/05/24.
//

import SwiftUI
import SwiftData

struct SettingBudget: View {
    @Environment(\.modelContext) var modelContext
    
    @State private var width: CGFloat = (UIScreen.main.bounds.width - 60) * 0.5
    @State private var width1: CGFloat = (UIScreen.main.bounds.width - 60) * 0.8
    
    @State private var navigateToBudgeting = false
    var budget: Int
    var budgetings: [BudgetingData]
    var isPreview: Bool = false
    
    var body: some View {
        let totalWidth = UIScreen.main.bounds.width - 60
        let basicNeedsPercentage = ((width / totalWidth) * 100).rounded()
        let savingsPercentage = (((width1 - width) / totalWidth) * 100).rounded()
        let wantsPercentage = (((totalWidth - width1) / totalWidth) * 100).rounded()
        
        NavigationView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("Spending Budget")
                        .font(.title3)
                        .fontWeight(.bold)
                    Text("Enter your spending budget in one month.")
                        .fontWeight(.light)
                    Spacer().frame(height: 10)
                    HStack {
                        Text("Rp.")
                            .font(.title2)
                        Text("\(self.budget)")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                }
                .padding(.horizontal, 20)
                
                Rectangle()
                    .frame(height: 10)
                    .foregroundColor(Color(hex: "DCD5FF"))
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Expend Allocation")
                        .font(.system(size: 20))
                    HStack(spacing: 20) {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                            .font(.title3)
                        Text("Tip: You can adjust your budget by sliding the slider.")
                    }
                    .frame(maxWidth: .infinity)
                    .padding(10)
                    .background(Color(hex: "FEF2E0"))
                    .foregroundColor(Color(hex: "DF9723"))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(hex: "DF9723"), lineWidth: 2)
                    )
                    
                    Spacer().frame(height: 20)
                    
                    Slider(totalWidth: totalWidth, width: $width, width1: $width1)
                    
                    SettingBudgetRow(basicNeedsPercentage: .constant(basicNeedsPercentage), wantsPercentage: .constant(wantsPercentage), savingsPercentage: .constant(savingsPercentage), budget: .constant(self.budget))
                    Spacer()
                }
                .padding(20)
                
                Button(action: {
                    if !isPreview {
                        self.saveBudgeting(basicNeedsPercentage: basicNeedsPercentage.rounded(), savingsPercentage: savingsPercentage.rounded(), wantsPercentage: wantsPercentage.rounded())
                    }
                    self.navigateToBudgeting = true
                }) {
                    Text("Save Budget")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .background(Color(red: 83/255, green: 57/255, blue: 238/255, opacity: 1))
                        .cornerRadius(40)
                }
                .padding(20)
                
                NavigationLink(destination: BudgetingView(budgetings: self.budgetings, budget: self.budget), isActive: $navigateToBudgeting) {
                    EmptyView()
                }
                
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func saveBudgeting(basicNeedsPercentage: Double, savingsPercentage: Double, wantsPercentage: Double) {
        let basicNeeds = BudgetingData( name: "Basic Needs", percentage: basicNeedsPercentage, budget: .dailyneeds)
        let savings = BudgetingData(name: "Savings", percentage: savingsPercentage, budget: .saving)
        let wants = BudgetingData(name: "Wants", percentage: wantsPercentage, budget: .wants)
        
        modelContext.insert(basicNeeds)
        modelContext.insert(savings)
        modelContext.insert(wants)
        
        do {
            try modelContext.save()
            print("Budgeting data saved successfully.")
        } catch {
            print("Failed to save budgeting data: \(error.localizedDescription)")
        }
    }
}

#Preview {
    SettingBudget(budget: 3000000, budgetings: [
        BudgetingData( name: "Basic Needs", percentage: 50, budget: .dailyneeds),
        BudgetingData( name: "Savings", percentage: 20, budget: .saving),
        BudgetingData(name: "Wants", percentage: 30, budget: .wants)
    ], isPreview: true)
}
