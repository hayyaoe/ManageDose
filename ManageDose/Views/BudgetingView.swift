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
        let basicNeedsPercentage = budgetings.first(where: { $0.budget == .dailyneeds })?.percentage ?? 0
        let savingsPercentage = budgetings.first(where: { $0.budget == .saving })?.percentage ?? 0
        let wantsPercentage = budgetings.first(where: { $0.budget == .wants })?.percentage ?? 0
        
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
            ScrollView(.vertical, showsIndicators: false){
                LazyVStack(spacing: 20){
                    PieChart(
                        basic: basicNeedsPercentage,
                        savings: savingsPercentage,
                        wants: wantsPercentage,
                        budget: self.budget
                    )

                    HStack{
                        Text("Expend Alocation")
                            .fontWeight(.semibold)
                                .font(.title3)
                    Spacer()
                }
                .padding(EdgeInsets(top: 5, leading: 15, bottom: 0, trailing: 20))
                NavigationLink(destination: DetailBudget()) {
                    BudgetProgressCard(progressPercentage: 0.3, budget: 1000)
                }
                NavigationLink(destination: DetailBudget()) {
                    BudgetProgressCard(progressPercentage: 0.7, budget: 1000)
                }
                NavigationLink(destination: DetailBudget()) {
                    BudgetProgressCard(progressPercentage: 0.9, budget: 1000)
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
        let example = [BudgetingData(name: "Basic Needs", percentage: 50, budget: .dailyneeds), BudgetingData(name: "Wants", percentage: 30, budget: .wants), BudgetingData(name: "Savings", percentage: 20, budget: .saving)]
        
        @State var budgetings = example
        
        return BudgetingView(budgetings: $budgetings, budget: 3000000)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
