//
//  IncomeDetail.swift
//  ManageDose
//
//  Created by MacBook Pro on 26/05/24.
//

import SwiftUI
import SwiftData

struct IncomeDetailView: View {
    @Environment(\.modelContext) private var context
    @Binding var incomes : [IncomeData]
    @Binding var budgets : [BudgetingData]
    @Binding var selectedTab: Int
    @State private var showSheet = false
    @State private var allFieldsFilled = false
    var totalIncome: Double {
        incomes.reduce(0) { $0 + $1.amount }
    }
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                Text("Insert Insertion Source")
                    .font(.title3)
                    .fontWeight(.semibold)
                Text("Enter Your Income in one month")
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray)
            }
            .padding(.horizontal, 15)
            .frame(maxWidth: .infinity, alignment: .leading)
            Rectangle()
                .fill(Color(red: 220/255, green: 213/255, blue: 255/255, opacity: 1))
                .frame(width:400, height: 10)
                .offset(y: 8)
            ScrollView(.vertical, showsIndicators: false){
                LazyVStack(){
                    ForEach(incomes){ income in
                        IncomeCard(incomeName: income.name, incomeCategory: income.categoryTransaction, incomeAmount: income.amount, incomeDate: income.date)
                    }
                }
            }
            .overlay(
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
                .offset(x: -10, y: 230)
            )


            Divider()
                .background(Color.gray)
                .frame(width:400)
                .offset(y: -8)


            HStack{
                Text("Total Income")
                    .font(.system(size: 18))
                    .fontWeight(.regular)
                    .foregroundStyle(.gray)

                Spacer()
                Text("Rp. \(totalIncome, specifier: "%.2f")")
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            .padding(.top, 0)
            
            NavigationLink(destination: SettingBudget(budgetings: $budgets, selectedTab: $selectedTab, budget: totalIncome, isPreview: false).toolbar(.hidden, for: .tabBar), label: {
                Text("Submit")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 83/255, green: 57/255, blue: 238/255, opacity: 1))
                    .cornerRadius(40)
            })
        }
        .padding(.horizontal, 15)
        .navigationBarTitle(Text("Detail Budget")
            .font(.title3)
            .fontWeight(.semibold)
        , displayMode: .inline)
        .sheet(isPresented: $showSheet, content: {
            AddNewExpenseCard(allFieldsFilled: $allFieldsFilled, isIncome: true)
                .presentationDetents([.height(420)])
            
        })

    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: BudgetingData.self, configurations: config)
        let example = [BudgetingData(name: "Basic Needs", percentage: 50, budget: .dailyneeds), BudgetingData(name: "Wants", percentage: 30, budget: .wants), BudgetingData(name: "Savings", percentage: 20, budget: .saving)]
        
        let incomeExample = [IncomeData(name: "Salary", date: Date(), amount: 1000000, categoryTransaction: .salary), IncomeData(name: "Salary", date: Date(), amount: 1000000, categoryTransaction: .salary), IncomeData(name: "Salary", date: Date(), amount: 1000000, categoryTransaction: .salary)]
        
        @State var budgetings = example
        @State var incomes = incomeExample
        @State var selectedTab = 1
        
        return IncomeDetailView(incomes: $incomes, budgets: $budgetings, selectedTab: $selectedTab)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
