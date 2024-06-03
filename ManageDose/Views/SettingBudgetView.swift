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
    @Binding var budgetings: [BudgetingData]
    
    @State private var width: CGFloat = 0.0
    @State private var width1: CGFloat = 0.0
    
    @State private var navigateToBudgeting = false
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var budget: Double
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
                        Text("\(self.budget, format: .number)")
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
                    
                    SettingBudgetRow(basicNeedsPercentage: .constant(basicNeedsPercentage), wantsPercentage: .constant(wantsPercentage), savingsPercentage: .constant(savingsPercentage), budget: .constant(Int(Double(self.budget))))
                    Spacer()
                }
                .padding(20)
                
                Button(action: {
                    if !isPreview {
                        self.saveBudgeting(basicNeedsPercentage: basicNeedsPercentage, savingsPercentage: savingsPercentage, wantsPercentage: wantsPercentage)
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
                
                NavigationLink(value: "navigateToBudgeting", label: {
                    EmptyView()
                })
                
                Spacer()
            }
            .onAppear {
                if let dailyNeedsPercentage = budgetings.first(where: { $0.budget == .dailyneeds })?.percentage {
                    width = (UIScreen.main.bounds.width - 60) * CGFloat(dailyNeedsPercentage) / 100.0
                }

                if let dailyNeedsPercentage = budgetings.first(where: { $0.budget == .dailyneeds })?.percentage,
                    let savingsPercentage = budgetings.first(where: { $0.budget == .saving })?.percentage {
                    let combinedPercentage = dailyNeedsPercentage + savingsPercentage
                    width1 = (UIScreen.main.bounds.width - 60) * CGFloat(combinedPercentage) / 100.0
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Save Budget"),
                    message: Text(alertMessage),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
    
    func saveBudgeting(basicNeedsPercentage: Double, savingsPercentage: Double, wantsPercentage: Double) {
        budgetings.first(where: { $0.budget == .dailyneeds })?.percentage = basicNeedsPercentage
        budgetings.first(where: { $0.budget == .wants })?.percentage = wantsPercentage
        budgetings.first(where: { $0.budget == .saving })?.percentage = savingsPercentage
        
        do {
            try modelContext.save()
            print("Budgeting data saved successfully.")
            alertMessage = "Budgeting data saved successfully."
            showAlert = true
        } catch {
            print("Failed to save budgeting data: \(error.localizedDescription)")
            alertMessage = "Failed to save budgeting data: \(error.localizedDescription)"
            showAlert = true
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: BudgetingData.self, configurations: config)
        let example = [BudgetingData(name: "Basic Needs", percentage: 50, budget: .dailyneeds), BudgetingData(name: "Wants", percentage: 30, budget: .wants), BudgetingData(name: "Savings", percentage: 20, budget: .saving)]
        
        @State var budgetings = example
        
        return SettingBudget(budgetings: $budgetings, budget: 3000000, isPreview: true)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
