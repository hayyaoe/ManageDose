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
         
        VStack{
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    HStack{
                        VStack(
                            alignment: .leading
                        ) {
                            Text("Hello,")
                                .foregroundStyle(.gray)
                                .fontWeight(.semibold)
                                .font(.title3)
                            Text("Username")
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
                            VStack(
                                alignment: .leading
                            ){
                                Text("Available Budget")
                                    .foregroundStyle(.white)
                                    .font(.subheadline)
                                Text("Rp \(availableBudget(), format: .number)")
                                    .foregroundStyle(.white)
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .bold()
                            }
                            
                            Spacer()
                            
                            Button(action: {}, label: {
                                Text("Atur Ulang")
                                    .foregroundStyle(.white)
                                    .font(.caption)
                                    .padding(8)
                                    .background{
                                        Color(red:0.19215686274509805,green:0.10588235294117647,blue:0.7019607843137254).cornerRadius(18)
                                    }
                            })
                            
                        }
                        .padding(24)
                        
                        HStack{
                            HStack{
                                Image(systemName: "arrow.down.circle.fill")
                                    .foregroundStyle(.green)
                                    .font(.title)
                                    .bold()
                                
                                VStack(
                                    alignment: .leading
                                ){
                                    Text("Income")
                                        .foregroundStyle(.white)
                                        .font(.caption2)
                                        .lineSpacing(2.0)
                                    Text("Rp \(cumulativeIncome(),format: .number)")
                                        .font(.caption)
                                        .foregroundStyle(.white)
                                        .fontWeight(.medium)
                                        .truncationMode(.tail)
                                        .lineLimit(1)
                                }
                            }
                            .frame(width:140)
                            .padding(12)
                            .background{
                                Color(red:0.19215686274509805,green:0.10588235294117647,blue:0.7019607843137254).cornerRadius(16)
                            }
                            
                            HStack{
                                Image(systemName: "arrow.up.circle.fill")
                                    .foregroundStyle(.red)
                                    .font(.title)
                                    .bold()
                                
                                VStack(
                                    alignment: .leading
                                ){
                                    Text("Expense")
                                        .foregroundStyle(.white)
                                        .font(.caption2)
                                        .lineSpacing(2.0)
                                    Text("Rp \(cumulativeExpense(), format: .number)")
                                        .font(.caption)
                                        .foregroundStyle(.white)
                                        .fontWeight(.medium)
                                        .truncationMode(.tail)
                                        .lineLimit(1)
                                }
                            }
                            .frame(width:140)
                            .padding(12)
                            .background{
                                Color(red:0.19215686274509805,green:0.10588235294117647,blue:0.7019607843137254).cornerRadius(16)
                            }
                            
                        }.padding(.vertical)
                    }
                    .background{
                        Color(red:0.3254901960784314,green:0.2235294117647059,blue:0.9333333333333333).cornerRadius(20)
                    }
                    .padding(.horizontal)
                    
                }
                .padding(EdgeInsets(top: 80, leading: 0, bottom: 30, trailing: 0))
                .frame(maxWidth: .infinity)
                .background{
                    Color(red:0.8627450980392157 ,green:0.8352941176470589 ,blue:1 )
                }
                
                
                VStack{
                    HStack{
                        Text("Budgeting")
                            .fontWeight(.semibold)
                            .font(.title3)
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        LazyHStack(
                            spacing: 16
                        ){
                            ForEach(budgets){ budget in
                                BudgetingCard(budgetingData: budget, budgetAvailable: cumulativeIncome())
                            }
                        }
                        .padding(EdgeInsets(top:0, leading:20, bottom: 0, trailing: 20))
                    }
                    .overlay {
                        if budgets.isEmpty {
                            VStack{
                                Image(systemName: "list.bullet.rectangle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 30)
                                    .foregroundStyle(.gray)
                                    .padding(4)
                                Text("Create Budgeting to see budgeting")
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                                Button(action: {
                                    addBudgetingSample()
                                }, label: {
                                    Text("Add Budgeting Sample")
                                        .font(.caption)
                                })
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
                    }.padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    
                    LazyVStack{
                        ForEach(filteredExpenses) { expense in
                            ExpenseItem(expenseData: expense)
                        }
                        ForEach(filteredIncomes) { income in
                            IncomeItem(incomeData: income)
                        }
                        
                    }.padding(.horizontal)
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 100, trailing: 0))
                .overlay(alignment: .bottom) {
                    if filteredExpenses.isEmpty && filteredIncomes.isEmpty {
                        VStack{
                            Image(systemName: "list.bullet.rectangle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 30)
                                .foregroundStyle(.gray)
                                .padding(4)
                            Text("Add Transactions to see list")
                                .font(.caption)
                                .foregroundStyle(.gray)
                            Button(action: {
                                addIncomeSample()
//                                addExpenseSample()
                            }, label: {
                                Text("Add Transaction Sample")
                                    .font(.caption)
                            })
                        }
                        
                    }
                }
            }
            NavBar()
        }.ignoresSafeArea(.all)
    }
    
    private func filterData(for date: Date) {
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
    
    private func addBudgetingSample (){
        
        let data1 = BudgetingData(name: "Daily Needs", percentage: 0.5, budget: .dailyneeds)
        let data2 = BudgetingData( name: "Wants", percentage: 0.2, budget: .wants)
        let data3 = BudgetingData( name: "Savings", percentage: 0.3, budget: .saving)
        
        modelContext.insert(data1)
        modelContext.insert(data2)
        modelContext.insert(data3)
    }
    
    private func addIncomeSample (){
        
        let data4 = IncomeData(name: "Gaji Utama", date: Date(), amount: 1500000, categoryTransaction: .salary)
        let data5 = IncomeData(name: "Jual HP", date: Date(), amount: 250000, categoryTransaction:  .otherIncome)
        let data6 = IncomeData(name: "Gaji Youtube", date: Date(), amount: 250000, categoryTransaction: .otherIncome)
        
        modelContext.insert(data4)
        modelContext.insert(data5)
        modelContext.insert(data6)
    }
    
    private func addExpenseSample(){
        
        let data6 = ExpenseData(name: "Makan McD", date: Date(), amount: 60000, budget: .dailyneeds, categoryTransaction: .food)
        let data7 = ExpenseData(name: "Bayar Listrik", date: Date(), amount: 150000, budget: .saving, categoryTransaction: .electricity)
        let data8 = ExpenseData(name: "Gacoan", date: Date(), amount: 40000, budget: .saving, categoryTransaction: .food)
        
        modelContext.insert(data6)
        modelContext.insert(data7)
        modelContext.insert(data8)
    }
    
    private func availableBudget() -> Double {
      var cumulativeIncome = 0.0
      var cumulativeExpense = 0.0

      // Calculate cumulative income
      for income in filteredIncomes {
        cumulativeIncome += income.amount
      }

      // Calculate cumulative expense
      for expense in filteredExpenses {
        cumulativeExpense += expense.amount
      }

      // Return available budget
      return cumulativeIncome - cumulativeExpense
    }
    
    private func cumulativeExpense() -> Double{
        var cumulativeExpense = 0.0
        
        // Calculate cumulative expense
        for expense in filteredExpenses {
          cumulativeExpense += expense.amount
        }
        
        return cumulativeExpense
    }
    
    private func cumulativeIncome() -> Double{
        var cumulativeIncome = 0.0
        
        // Calculate cumulative expense
        for income in filteredIncomes{
          cumulativeIncome += income.amount
        }
        
        return cumulativeIncome
    }
}


#Preview {
    Home()
}

