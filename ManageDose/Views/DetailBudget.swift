//
//  DetailBudget.swift
//  ManageDose
//
//  Created by MacBook Pro on 25/05/24.
//

import SwiftUI
import SwiftData

struct DetailBudget: View {
    @Environment(\.modelContext) private var context
    @Query private var transactions : [TransactionData]
    @State private var showSheet = false
    @State private var allFieldsFilled = false
    var body: some View {
        VStack{
            BudgetProgressCard(colorAlert: Color(red: 31 / 255, green: 202 / 255, blue: 157 / 255, opacity: 1))
                .padding(.top, 10)
            Rectangle()
                .fill(Color(red: 220/255, green: 213/255, blue: 255/255, opacity: 1))
                .frame(width: 500, height: 20)
                .padding(10)
            ScrollView(.vertical, showsIndicators: false){
                LazyVStack(){
                    let expenseTransactions = transactions.filter { $0.cashFlow == .expense }
                    ForEach(expenseTransactions){ transaction in
                        ExpenseCard(expenseName: transaction.name, expenseCategory: transaction.category, expenseAmount: transaction.amount, expenseDate: transaction.date)
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
        }
        .padding(.horizontal, 15)
        .navigationBarTitle(Text("Detail Budget")
            .font(.title3)
            .fontWeight(.semibold)
        , displayMode: .inline)
        .sheet(isPresented: $showSheet, content: {
            AddNewExpenseCard(allFieldsFilled: $allFieldsFilled, isIncome: false)
                .presentationDetents([.height(420)])
            
        })
    }
}

#Preview {
    DetailBudget()
}
