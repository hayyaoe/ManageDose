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
    
    @State private var isDefaultBudgetingSet: Bool = false
    
    @Binding var incomes: [IncomeData]
    @Binding var expenses: [ExpenseData]
    @Binding var budgets: [BudgetingData]
    
    @Binding var selectedTab: Int
    @State private var navigationPath = [String]()
    
    var body: some View {
        if UIDevice.current.userInterfaceIdiom == .pad {
            NavigationStack{
                VStack{
                    ScrollView(.vertical, showsIndicators: false){
                        VStack{
                            VStack{
                                HStack{
                                    VStack(
                                        alignment: .leading
                                    ) {
                                        Text("Hello,")
                                            .foregroundStyle(.gray)
                                            .fontWeight(.semibold)
                                            .font(.system(size:25))
                                        Text("Willas")
                                            .fontWeight(.semibold)
                                            .font(.system(size:25))
                                    }
                                    
                                    Spacer()
                                    DatePicker(selection: $date, displayedComponents: [.date], label: {})
                                        .onChange(of: date, perform: { newDate in
                                            filterData(for: newDate)
                                        })
                                    
                                }
                                .padding(.horizontal)
                                VStack{
                                    HStack{
                                        VStack(alignment: .leading){
                                            Text("Available Budget")
                                                .foregroundColor(.white)
                                                .font(.system(size:20))
                                            Text("Rp \(availableBudget(), format: .number)")
                                                .foregroundColor(.white)
                                                .font(.system(size:40))
                                                .bold()
                                        }
                                        
                                        Spacer()
                                        
                                        NavigationLink(destination: IncomeDetailView(incomes: $incomes, budgets: $budgets, selectedTab: $selectedTab).toolbar(.hidden, for: .tabBar)) {
                                            Text("Set Target")
                                                .foregroundColor(.white)
                                                .font(.system(size:20))
                                                .padding(20)
                                                .background(Color(red: 0.192, green: 0.106, blue: 0.702).cornerRadius(18))
                                        }
                                    }
                                    .padding(24)
                                    
                                    HStack{
                                        HStack{
                                            Image(systemName: "arrow.down.circle.fill")
                                                .foregroundColor(.green)
                                                .font(.system(size:35))
                                                .bold()
                                            
                                            VStack(alignment: .leading){
                                                Text("Income")
                                                    .foregroundColor(.white)
                                                    .font(.system(size:20))
                                                    .lineSpacing(2.0)
                                                Text("Rp \(cumulativeIncome(), format: .number)")
                                                    .font(.system(size:22))
                                                    .foregroundColor(.white)
                                                    .fontWeight(.medium)
                                                    .truncationMode(.tail)
                                                    .lineLimit(1)
                                            }
                                        }
                                        .frame(width: 350)
                                        .padding(12)
                                        .background(Color(red: 0.192, green: 0.106, blue: 0.702).cornerRadius(16))
                                        
                                        HStack{
                                            Image(systemName: "arrow.up.circle.fill")
                                                .foregroundColor(.red)
                                                .font(.system(size:35))
                                                .bold()
                                            
                                            VStack(alignment: .leading){
                                                Text("Expense")
                                                    .foregroundColor(.white)
                                                    .font(.system(size:20))
                                                    .lineSpacing(2.0)
                                                Text("Rp \(cumulativeExpense(), format: .number)")
                                                    .font(.system(size:22))
                                                    .foregroundColor(.white)
                                                    .fontWeight(.medium)
                                                    .truncationMode(.tail)
                                                    .lineLimit(1)
                                            }
                                        }
                                        .frame(width: 350)
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
                                        .font(.title)
                                    Spacer()
                                }
                                .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
                                
                                ScrollView(.horizontal, showsIndicators: false){
                                    LazyHStack(spacing: 20){
                                        ForEach(budgets){ budget in
                                            NavigationLink(destination: DetailBudget(budgeting: Binding(get: { budget }, set: { _ in }))) {
                                                BudgetingCard(budgetingData: budget, budgetAvailable: cumulativeIncome())
                                            }
                                        }
                                    }
                                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 50))
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
                                                defaultBudgeting()
                                            }) {
                                                Text("Add Budgeting Sample")
                                                    .font(.caption)
                                            }
                                        }
                                    }
                                }
                            }
                            .frame(height: 250)
                            Spacer()
                            VStack{
                                HStack{
                                    Text("Latest Transaction")
                                        .fontWeight(.semibold)
                                        .font(.title)
                                    Spacer()
                                }
                                .padding(EdgeInsets(top: 20, leading: 20, bottom: 10, trailing: 20))
                                
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
                                    }
                                }
                            }
                        }
                    }
                    .ignoresSafeArea(.all)
                    .onAppear {
                        if budgets.isEmpty {
                            if !isDefaultBudgetingSet {
                                defaultBudgeting()
                                isDefaultBudgetingSet = true
                            }
                        }
                        filterData(for: date)
                    }
                    
                }.ignoresSafeArea(.all)
            }
        }else{
            NavigationStack{
                VStack{
                    ScrollView(.vertical, showsIndicators: false){
                        VStack{
                            VStack{
                                HStack{
                                    VStack(
                                        alignment: .leading
                                    ) {
                                        Text("Hello,")
                                            .foregroundStyle(.gray)
                                            .fontWeight(.semibold)
                                            .font(.title3)
                                        Text("Willas")
                                            .fontWeight(.semibold)
                                            .font(.title3)
                                    }
                                    
                                    Spacer()
                                    DatePicker(selection: $date, displayedComponents: [.date], label: {})
                                        .onChange(of: date, perform: { newDate in
                                            filterData(for: newDate)
                                        })
                                    
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
                                        
                                        NavigationLink(destination: IncomeDetailView(incomes: $incomes, budgets: $budgets, selectedTab: $selectedTab).toolbar(.hidden, for: .tabBar)) {
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
                                            NavigationLink(destination: DetailBudget(budgeting: Binding(get: { budget }, set: { _ in }))) {
                                                BudgetingCard(budgetingData: budget, budgetAvailable: cumulativeIncome())
                                            }
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
                                                defaultBudgeting()
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
                                    }
                                }
                            }
                        }
                    }
                    .ignoresSafeArea(.all)
                    .onAppear {
                        if budgets.isEmpty {
                            if !isDefaultBudgetingSet {
                                defaultBudgeting()
                                isDefaultBudgetingSet = true
                            }
                        }
                        filterData(for: date)
                    }
                    
                }.ignoresSafeArea(.all)
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
        let basicNeeds = BudgetingData(name: "Basic Needs", percentage: 50, budget: .dailyneeds, totalBudget: availableBudget(), used: 0)
        let savings = BudgetingData(name: "Savings", percentage: 20, budget: .saving, totalBudget: availableBudget(), used: 0)
        let wants = BudgetingData(name: "Wants", percentage: 30, budget: .wants, totalBudget: availableBudget(), used: 0)
        
        modelContext.insert(basicNeeds)
        modelContext.insert(savings)
        modelContext.insert(wants)
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
    
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: BudgetingData.self, IncomeData.self, ExpenseData.self, configurations: config)
        let example = [
            BudgetingData(name: "Basic Needs", percentage: 50, budget: .dailyneeds, totalBudget: 3000000, used: 500),
            BudgetingData(name: "Wants", percentage: 30, budget: .wants, totalBudget: 3000000, used: 100000),
            BudgetingData(name: "Savings", percentage: 20, budget: .saving, totalBudget: 3000000, used: 500000)]
        
        let incomeExample = [IncomeData(name: "Salary", date: Date(), amount: 1000000, categoryTransaction: .salary), IncomeData(name: "Salary", date: Date(), amount: 1000000, categoryTransaction: .salary), IncomeData(name: "Salary", date: Date(), amount: 1000000, categoryTransaction: .salary)]
        
        let expenseExample = [ExpenseData(name: "Salary", date: Date(), amount: 1000000, budget: .wants, categoryTransaction: .salary)]
        
        @State var budgetings = example
        @State var incomes = incomeExample
        @State var expenses = expenseExample
        @State var selectedTab = 1
        
        return Home(incomes: $incomes, expenses: $expenses, budgets: $budgetings, selectedTab: $selectedTab)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
