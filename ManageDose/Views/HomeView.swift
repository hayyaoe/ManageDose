//
//  HomeView.swift
//  ManageDose
//
//  Created by RabiRabi Channel on 20/05/24.
//

import SwiftUI
import SwiftData

struct Home: View {
    
    @Environment(\.modelContext) var modelContext
    
    @State var date = Date()
    @State var filteredExpenses: [ExpenseData] = []
    @State var filteredIncomes: [IncomeData] = []
    
    @Query var incomes: [IncomeData]
    @Query var expenses: [ExpenseData]
    @Query var budgets: [BudgetingData]
    
    var body: some View {
        
        NavigationView{
            VStack{
                ScrollView(.vertical, showsIndicators: false){
                    VStack{
                        HStack{
                            VStack(alignment: .leading) {
                                Text("Hello,")
                                    .foregroundColor(.gray)
                                    .fontWeight(.semibold)
                                    .font(.title3)
                                Text("Username")
                                    .fontWeight(.semibold)
                                    .font(.title3)
                            }
                            
                            Spacer()
                            
                            DatePicker(selection: $date, displayedComponents: [.date], label: {})
                                .onChange(of: date) { newDate in
                                    filterData(for: newDate)
                                }
                        }
                        .padding(.horizontal)
                        
                        VStack{
                            HStack{
                                VStack(alignment: .leading){
                                    Text("Available Budget")
                                        .foregroundColor(.white)
                                        .font(.subheadline)
                                    Text("Rp \(availableBudget(), format: .number)")
                                        .foregroundColor(.white)
                                        .font(.title)
                                        .bold()
                                }
                                
                                Spacer()
                                
                                NavigationLink(destination: SettingBudget(budgetings: .constant(self.budgets), budget: self.availableBudget())) {
                                                                    Text("Atur Ulang")
                                                                        .foregroundColor(.white)
                                                                        .font(.caption)
                                                                        .padding(8)
                                                                        .background(Color(red: 0.192, green: 0.106, blue: 0.702).cornerRadius(18))
                                                                }
                            }
                            .padding(24)
                            
                            HStack{
                                HStack{
                                    Image(systemName: "arrow.down.circle.fill")
                                        .foregroundColor(.green)
                                        .font(.title)
                                        .bold()
                                    
                                    VStack(alignment: .leading){
                                        Text("Income")
                                            .foregroundColor(.white)
                                            .font(.caption2)
                                            .lineSpacing(2.0)
                                        Text("Rp \(cumulativeIncome(), format: .number)")
                                            .font(.caption)
                                            .foregroundColor(.white)
                                            .fontWeight(.medium)
                                            .truncationMode(.tail)
                                            .lineLimit(1)
                                    }
                                }
                                .frame(width: 140)
                                .padding(12)
                                .background(Color(red: 0.192, green: 0.106, blue: 0.702).cornerRadius(16))
                                
                                HStack{
                                    Image(systemName: "arrow.up.circle.fill")
                                        .foregroundColor(.red)
                                        .font(.title)
                                        .bold()
                                    
                                    VStack(alignment: .leading){
                                        Text("Expense")
                                            .foregroundColor(.white)
                                            .font(.caption2)
                                            .lineSpacing(2.0)
                                        Text("Rp \(cumulativeExpense(), format: .number)")
                                            .font(.caption)
                                            .foregroundColor(.white)
                                            .fontWeight(.medium)
                                            .truncationMode(.tail)
                                            .lineLimit(1)
                                    }
                                }
                                .frame(width: 140)
                                .padding(12)
                                .background(Color(red: 0.192, green: 0.106, blue: 0.702).cornerRadius(16))
                                
                            }
                            .padding(.vertical)
                        }
                        .background(Color(red: 0.325, green: 0.224, blue: 0.933).cornerRadius(20))
                        .padding(.horizontal)
                    }
                    .padding(EdgeInsets(top: 80, leading: 0, bottom: 30, trailing: 0))
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 0.863, green: 0.835, blue: 1))
                    
                    VStack{
                        HStack{
                            Text("Budgeting")
                                .fontWeight(.semibold)
                                .font(.title3)
                            Spacer()
                        }
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            LazyHStack(spacing: 16){
                                ForEach(budgets){ budget in
                                    BudgetingCard(budgetingData: budget, budgetAvailable: cumulativeIncome())
                                }
                            }
                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                        }
                        .overlay {
                            if budgets.isEmpty {
                                VStack{
                                    Image(systemName: "list.bullet.rectangle")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 30)
                                        .foregroundColor(.gray)
                                        .padding(4)
                                    Text("Create Budgeting to see budgeting")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                    Button(action: {
                                        addBudgetingSample()
                                    }) {
                                        Text("Add Budgeting Sample")
                                            .font(.caption)
                                    }
                                }
                            }
                        }
                    }
                    .frame(height: 200)
                    
                    VStack{
                        HStack{
                            Text("Latest Transaction")
                                .fontWeight(.semibold)
                                .font(.title3)
                            Spacer()
                        }
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        
                        LazyVStack{
                            ForEach(filteredExpenses) { expense in
                                ExpenseItem(expenseData: expense)
                            }
                            ForEach(filteredIncomes) { income in
                                IncomeItem(incomeData: income)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 100, trailing: 0))
                    .overlay(alignment: .bottom) {
                        if expenses.isEmpty && incomes.isEmpty {
                            VStack{
                                Image(systemName: "list.bullet.rectangle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 30)
                                    .foregroundColor(.gray)
                                    .padding(4)
                                Text("Add Transactions to see list")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                Button(action: {
                                    addIncomeSample()
                                    addExpenseSample()
                                }) {
                                    Text("Add Transaction Sample")
                                        .font(.caption)
                                }
                            }
                        }
                    }
                }
                NavBar()
            }
            .ignoresSafeArea(.all)
            .toolbar{
                Button("Add Default Budgeting", action: defaultBudgeting)
            }
        }
    }
    
    func filterData(for date: Date) {
        let calendar = Calendar.current
        let targetComponents = calendar.dateComponents([.year, .month], from: date)
        
        filteredExpenses = expenses.filter { expense in
            let expenseComponents = calendar.dateComponents([.year, .month], from: expense.date)
            return expenseComponents.year == targetComponents.year && expenseComponents.month == targetComponents.month
        }
        
        filteredIncomes = incomes.filter { income in
            let incomeComponents = calendar.dateComponents([.year, .month], from: income.date)
            return incomeComponents.year == targetComponents.year && incomeComponents.month == targetComponents.month
        }
    }
    
    func defaultBudgeting() {
        let basicNeeds = BudgetingData(name: "Basic Needs", percentage: 50, budget: .dailyneeds)
        let savings = BudgetingData(name: "Savings", percentage: 20, budget: .saving)
        let wants = BudgetingData(name: "Wants", percentage: 30, budget: .wants)
        
        modelContext.insert(basicNeeds)
        modelContext.insert(savings)
        modelContext.insert(wants)
    }
    
    func addBudgetingSample() {
        let data1 = BudgetingData(name: "Daily Needs", percentage: 0.5, budget: .dailyneeds)
        let data2 = BudgetingData(name: "Wants", percentage: 0.2, budget: .wants)
        let data3 = BudgetingData(name: "Savings", percentage: 0.3, budget: .saving)
        
        modelContext.insert(data1)
        modelContext.insert(data2)
        modelContext.insert(data3)
    }
    
    func addIncomeSample() {
        let data4 = IncomeData(name: "Gaji Utama", date: Date(), amount: 1500000, categoryTransaction: .salary)
        let data5 = IncomeData(name: "Jual HP", date: Date(), amount: 250000, categoryTransaction: .otherIncome)
        let data6 = IncomeData(name: "Gaji Youtube", date: Date(), amount: 250000, categoryTransaction: .otherIncome)
        
        modelContext.insert(data4)
        modelContext.insert(data5)
        modelContext.insert(data6)
    }
    
    func addExpenseSample() {
        let data6 = ExpenseData(name: "Makan McD", date: Date(), amount: 60000, budget: .dailyneeds, categoryTransaction: .food)
        let data7 = ExpenseData(name: "Bayar Listrik", date: Date(), amount: 150000, budget: .saving, categoryTransaction: .electricity)
        let data8 = ExpenseData(name: "Gacoan", date: Date(), amount: 40000, budget: .saving, categoryTransaction: .food)
        
        modelContext.insert(data6)
        modelContext.insert(data7)
        modelContext.insert(data8)
    }
    
    func availableBudget() -> Double {
        var cumulativeIncome = 0.0
        var cumulativeExpense = 0.0

        for income in filteredIncomes {
            cumulativeIncome += income.amount
        }

        for expense in filteredExpenses {
            cumulativeExpense += expense.amount
        }

        return cumulativeIncome - cumulativeExpense
    }
    
    func cumulativeExpense() -> Double {
        var cumulativeExpense = 0.0
        
        for expense in filteredExpenses {
            cumulativeExpense += expense.amount
        }
        
        return cumulativeExpense
    }
    
    func cumulativeIncome() -> Double {
        var cumulativeIncome = 0.0
        
        for income in filteredIncomes {
            cumulativeIncome += income.amount
        }
        
        return cumulativeIncome
    }
}

#Preview {
    Home()
}
