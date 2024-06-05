//
//  AddNewExpenseView.swift
//  ManageDose
//
//  Created by student on 24/05/24.
//

import SwiftUI
import SwiftData

struct AddNewExpenseView: View {
    @Environment(\.modelContext) var modelContext
    @Binding var budgetings: [BudgetingData]
    
    @State private var showSheet = false
    @State private var allFieldsFilled = false
    
    var body: some View {
        
        VStack{
            BudgetProgressCard(budget: 1000, used: 500, name: "Basic Needs")
                .padding(.horizontal)
//            Button(action: {
//
//            }) {
//                Text("Add New Transaction")
//                    .foregroundColor(.white)
//                    .padding()
//                    .frame(maxWidth: .infinity)
//                    .background(Color(red: 83/255, green: 57/255, blue: 238/255, opacity: 1))
//                    .cornerRadius(24)
//                
//            }
            .padding()
            Rectangle()
                .fill(Color(red: 220/255, green: 213/255, blue: 255/255, opacity: 1))
                .frame(width: 500, height: 20)
                .padding(10)
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    showSheet.toggle()
                }) {
                    ZStack {
                        Circle()
                            .fill(Color(red: 83/255, green: 57/255, blue: 238/255, opacity: 1))
                            .frame(width: 60, height: 60)
                        Image(systemName: "plus")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                }
            }
            .padding(36)
            
            
        }
        .sheet(isPresented: $showSheet, content: {
            AddNewExpenseCard(allFieldsFilled: $allFieldsFilled, isIncome: false)
                .presentationDetents([.height(420)])
            
        })
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: BudgetingData.self, configurations: config)
        let example = [
            BudgetingData(name: "Basic Needs", percentage: 50, budget: .dailyneeds, totalBudget: 3000000, used: 500),
            BudgetingData(name: "Wants", percentage: 30, budget: .wants, totalBudget: 3000000, used: 100000),
            BudgetingData(name: "Savings", percentage: 20, budget: .saving, totalBudget: 3000000, used: 500000)]
        
        @State var budgetings = example
        
        return AddNewExpenseView(budgetings: $budgetings)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
