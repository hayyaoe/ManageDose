//
//  AddNewExpenseCard.swift
//  ManageDose
//
//  Created by student on 24/05/24.
//

import SwiftUI
import SwiftData

struct AddNewExpenseCard: View {
    @Environment(\.modelContext) private var context
    @Binding var allFieldsFilled: Bool
    var isIncome: Bool
    let category : String
    @State private var selectedOption = "Option 1"
    
//    let incomeCategoryOptions: [CategoryTransaction] = [.salary, .otherIncome]
//        let expenseCategoryOptions: [CategoryTransaction] = [.electricity, .food]
//            
//        var options: [CategoryTransaction] {
//            return isIncome ? incomeCategoryOptions : expenseCategoryOptions
//        }
    var options: [CategoryTransaction] {
            if isIncome {
                return incomeCategoryOptions
            } else {
                switch category {
                case "Savings":
                    return savingOptions
                case "Basic Needs":
                    return basicNeedsOptions
                case "Wants":
                    return wantsOptions
                default:
                    return []
                }
            }
        }
    
        
    let incomeCategoryOptions: [CategoryTransaction] = [.salary, .otherIncome]
    let savingOptions: [CategoryTransaction] = [.investment, .retirement]
    let basicNeedsOptions: [CategoryTransaction] = [.electricity, .food]
    let wantsOptions: [CategoryTransaction] = [.entertainment, .shopping]
        
    
    var icon: String {
        switch category {
        case "Basic Needs":
            return "basic needs"
        case "Wants":
            return "wants"
        case "Savings":
            return "savings"
        default:
            return "basic needs"
        }
    }
    

    @State private var expenseName: String = ""
    @State private var expenseAmount: Double = 50000.0
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
                Text(isIncome ? "Add Income" : "Add Expense")
                    .bold()
                    .font(.headline)
                    .padding(.bottom, 12)
                HStack(
                    spacing: 24
                ){
                    Image(icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height:50)
                        .foregroundStyle(.blue)
                        .padding(EdgeInsets(top:0, leading:0, bottom: 10, trailing: 0))
                    VStack(alignment: .leading){
                        Text("\(isIncome ? "Income" : "Expense") Name")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .padding(.bottom, 4)
                        TextField("Food and Drink", text: $expenseName)
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                        SeparatorBar()
                            .padding(.bottom, 8)
                        
                    }
                }
                
                Text("\(isIncome ? "Income" : "Expense") Category")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .padding(.bottom, 4)
                Picker("Please choose an option", selection: $selectedOption) {
                    ForEach(options, id: \.self) { option in
                        Text(option.rawValue)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .frame(width: 360, height: 30)
                .background(Color.white.opacity(0.2))
                .cornerRadius(5)
                .shadow(color: .white, radius: 2, x: 0, y: 0.1)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.blue, lineWidth: 1)
                    )
                    .padding(.bottom, 5)
                
                Text("\(isIncome ? "Income" : "Expense") Amount")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .padding(.bottom, 4)
                TextField("Rp 0", value: $expenseAmount, formatter: numberFormatter)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                    .keyboardType(.numberPad)
                SeparatorBar()
                    .padding(.bottom, 8)
                
                HStack {
                    Text("\(isIncome ? "Income" : "Expense") Date")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .padding(.bottom, 4)
                    DatePicker("", selection: $expenseDate, displayedComponents: .date)
                        .font(.caption)
                    Spacer()
                }
                Button(action: {
                    if isIncome{
                        addIncome()
                        
                    }else{
                        addExpense()
                    }
                }) {
                    Text("Add Expense")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 83/255, green: 57/255, blue: 238/255, opacity: 1))
                        .cornerRadius(24)
                    
                }
                .padding(12)
            }
            
        }
        .padding(15)
        .background(Color.white)
    }
    
    func addIncome(){
        let income = IncomeData(name: expenseName, date: expenseDate, amount: expenseAmount, categoryTransaction: CategoryTransaction(rawValue: selectedOption) ?? .salary)
        context.insert(income)
    }

    func addExpense() {
        var budget: Budget
        switch category {
            case "Basic Needs":
                budget = .dailyneeds
            case "Wants":
                budget = .wants
            case "Savings":
                budget = .saving
        default:
            budget = .dailyneeds
        }
        let expense = ExpenseData(name: expenseName, date: expenseDate, amount: expenseAmount, budget: budget, categoryTransaction: CategoryTransaction(rawValue: selectedOption) ?? .electricity)
        context.insert(expense)
    }
}

#Preview {
    AddNewExpenseCard(allFieldsFilled: .constant(false), isIncome: true, category: "Basic Needs")
}
