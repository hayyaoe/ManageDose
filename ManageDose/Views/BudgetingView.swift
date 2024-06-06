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
                    .padding(.horizontal)
                }
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
        @State var selectedTab = 1
        
        return BudgetingView(budgetings: $budgetings, selectedTab: $selectedTab, budget: 3000000)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
