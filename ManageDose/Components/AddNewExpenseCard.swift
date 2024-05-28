//
//  AddNewExpenseCard.swift
//  ManageDose
//
//  Created by student on 24/05/24.
//

import SwiftUI

struct AddNewExpenseCard: View {
    @Binding var allFieldsFilled: Bool
    
    @State private var expenseCategory: String = ""
    @State private var expenseName: String = ""
    @State private var expenseAmount: Double = 50.000
    @State private var expenseDate: Date = Date()
    
    private var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = ""
        return formatter
    }
    
    var body: some View {
        VStack(
            spacing: 8
        ){
            PopUpBar()
                .padding(.bottom, 24)
            
            VStack(alignment: .leading){
                Text("Add Expense")
                    .bold()
                    .font(.headline)
                    .padding(.bottom, 12)
                HStack(
                    spacing: 24
                ){
                    Image(systemName: "checkmark.square.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height:50)
                        .foregroundStyle(.blue)
                        .padding(EdgeInsets(top:0, leading:0, bottom: 10, trailing: 0))
                    VStack(alignment: .leading){
                        Text("Expense Category")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .padding(.bottom, 4)
                        TextField("Food and Drink", text: $expenseCategory)
                            .font(.caption)
                            .foregroundStyle(.gray)
                        SeparatorBar()
                            .padding(.bottom, 8)
                        
                    }
                }
                
                Text("Expense Name")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .padding(.bottom, 4)
                TextField("Ex: Denver Food", text: $expenseName)
                    .font(.caption)
                    .foregroundStyle(.gray)
                SeparatorBar()
                    .padding(.bottom, 8)
                
                Text("Expense Amount")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .padding(.bottom, 4)
                TextField("Rp 0", value: $expenseAmount, formatter: numberFormatter)
                    .font(.caption)
                    .foregroundStyle(.gray)
                SeparatorBar()
                    .padding(.bottom, 8)
                
                HStack {
                    Text("Expense Date")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .padding(.bottom, 4)
                    DatePicker("", selection: $expenseDate, displayedComponents: .date)
                        .font(.caption)
                    Spacer()
                }
                
            }
            .onChange(of: expenseName) { checkAllFields() }
            .onChange(of: expenseAmount) { checkAllFields() }
            .onChange(of: expenseCategory) { checkAllFields() }
            
        }
        .padding(15)
        .background(Color.white)
        //        .clipShape(
        //            .rect(
        //                topLeadingRadius: 36,
        //                topTrailingRadius: 36
        //            )
        //        )
        //        .shadow(color: Color.black.opacity(0.15), radius: 4, x: 0, y: 0)
        
    }
    private func checkAllFields() {
        allFieldsFilled = !expenseName.isEmpty && expenseAmount != 0 && !expenseCategory.isEmpty
    }
}

#Preview {
    AddNewExpenseCard(allFieldsFilled: .constant(false))
}
