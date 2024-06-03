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
    @Query private var expenses : [ExpenseData]
    @State private var showSheet = false
    @State private var allFieldsFilled = false
    var body: some View {
        VStack{
            BudgetProgressCard(progressPercentage: 0.7, budget: 1000)
                .padding(.top, 10)
            Rectangle()
                .fill(Color(red: 220/255, green: 213/255, blue: 255/255, opacity: 1))
                .frame(width: 500, height: 20)
                .padding(10)
            ScrollView(.vertical, showsIndicators: false){
                LazyVStack(){
                    ForEach(expenses){ expense in
                        ExpenseCard(expenseName: expense.name, expenseCategory: expense.categoryTransaction, expenseAmount: expense.amount, expenseDate: expense.date)
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
