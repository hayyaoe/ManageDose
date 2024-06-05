//
//  BudgetingView.swift
//  ManageDose
//
//  Created by MacBook Pro on 22/05/24.
//

import SwiftUI
import SwiftData

struct BudgetingView: View {
    @Environment(\.modelContext) var modelContext
    @Binding var budgetings: [BudgetingData]
    
    var budget: Double
    
    var body: some View {
        let basicNeeds = budgetings.first(where: { $0.budget == .dailyneeds })
        let savings = budgetings.first(where: { $0.budget == .saving })
        let wants = budgetings.first(where: { $0.budget == .wants })
        
        let basicNeedsPercentage = basicNeeds?.percentage ?? 0
        let savingsPercentage = savings?.percentage ?? 0
        let wantsPercentage = wants?.percentage ?? 0
        
        let basicNeedsAmount = basicNeeds?.amount ?? 0
        let savingsAmount = savings?.amount ?? 0
        let wantsAmount = wants?.amount ?? 0
        
        let basicNeedsUsed = basicNeeds?.used ?? 0
        let savingsUsed = savings?.used ?? 0
        let wantsUsed = wants?.used ?? 0
        
        VStack{
            HStack{
                Text("Budgeting")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .overlay(
                        Image(systemName: "bell.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .foregroundColor(Color(red: 99 / 255.0, green: 97 / 255.0, blue: 148 / 255.0))
                            .overlay(
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 12, height: 12)
                                    .offset(x: 12, y: -12)
                            )
                            .offset(x: 150)
                    )
            }
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 20) {
                    PieChart(
                        basic: basicNeedsPercentage,
                        savings: savingsPercentage,
                        wants: wantsPercentage,
                        budget: self.budget
                    )
                    HStack {
                        Text("Expend Allocation")
                            .fontWeight(.semibold)
                            .font(.title3)
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 5, leading: 15, bottom: 0, trailing: 20))
                    if let basicNeeds = basicNeeds {
                        NavigationLink(destination: DetailBudget(budgeting: Binding(get: { basicNeeds }, set: { _ in }))) {
                            BudgetProgressCard(budget: basicNeedsAmount, used: basicNeedsUsed, name: "Basic Needs")
                        }
                    }
                    if let wants = wants {
                        NavigationLink(destination: DetailBudget(budgeting: Binding(get: { wants }, set: { _ in }))) {
                            BudgetProgressCard(budget: wantsAmount, used: wantsUsed, name: "Wants")
                        }
                    }
                    if let savings = savings {
                        NavigationLink(destination: DetailBudget(budgeting: Binding(get: { savings }, set: { _ in }))) {
                            BudgetProgressCard(budget: savingsAmount, used: savingsUsed, name: "Savings")
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: BudgetingData.self, configurations: config)
        let example = [
            BudgetingData(name: "Basic Needs", percentage: 50, budget: .dailyneeds, totalBudget: 3000000, used: 500),
            BudgetingData(name: "Wants", percentage: 30, budget: .wants, totalBudget: 3000000, used: 100000),
            BudgetingData(name: "Savings", percentage: 20, budget: .saving, totalBudget: 3000000, used: 500000)
        ]
        
        @State var budgetings = example
        
        return BudgetingView(budgetings: $budgetings, budget: 3000000)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
