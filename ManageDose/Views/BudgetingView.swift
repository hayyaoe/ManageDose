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
    @Binding var selectedTab: Int
    
    @State private var navigationPath = [String]()
    
    var budget: Double
    
    var body: some View {
        let basicNeeds = budgetings.first(where: { $0.budget == .dailyneeds })
        let savings = budgetings.first(where: { $0.budget == .saving })
        let wants = budgetings.first(where: { $0.budget == .wants })
        
        NavigationStack(path: $navigationPath){
            VStack{
                HStack{
                    Text("Budgeting")
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(spacing: 20) {
                        NavigationLink(destination: SettingBudget(budgetings: $budgetings, budget: budget, isPreview: false).toolbar(.hidden, for: .tabBar), label: {
                            PieChart(
                                basic: basicNeeds?.percentage ?? 0,
                                savings: savings?.percentage ?? 0,
                                wants: wants?.percentage ?? 0,
                                budget: self.budget
                            )
                        })
                        HStack {
                            Text("Expend Allocation")
                                .fontWeight(.semibold)
                                .font(.title3)
                            Spacer()
                        }
                        .padding(EdgeInsets(top: 5, leading: 15, bottom: 0, trailing: 20))
                        VStack{
                            if let basicNeeds = basicNeeds {
                                NavigationLink(destination: DetailBudget(budgeting: Binding(get: { basicNeeds }, set: { _ in }))) {
                                    BudgetProgressCard(budget: basicNeeds.amount, used: basicNeeds.used, name: "Basic Needs")
                                }
                            }
                            if let wants = wants {
                                NavigationLink(destination: DetailBudget(budgeting: Binding(get: { wants }, set: { _ in }))) {
                                    BudgetProgressCard(budget: wants.amount, used: wants.used, name: "Wants")
                                }
                            }
                            if let savings = savings {
                                NavigationLink(destination: DetailBudget(budgeting: Binding(get: { savings }, set: { _ in }))) {
                                    BudgetProgressCard(budget: savings.amount, used: savings.used, name: "Savings")
                                }
                            }
                        }
                        
                    }
                    .padding(.horizontal)
                    .padding(15)
                }
            }
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: BudgetingData.self, configurations: config)

        // Mock data for preview
        let example = [
            BudgetingData(name: "Basic Needs", percentage: 50, budget: .dailyneeds, totalBudget: 3000000, used: 500),
            BudgetingData(name: "Wants", percentage: 30, budget: .wants, totalBudget: 3000000, used: 100000),
            BudgetingData(name: "Savings", percentage: 20, budget: .saving, totalBudget: 3000000, used: 500000)
        ]

        // State variables for preview
        @State var budgetings = example
        @State var selectedTab = 1

        return BudgetingView(budgetings: $budgetings, selectedTab: $selectedTab, budget: 3000000)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
