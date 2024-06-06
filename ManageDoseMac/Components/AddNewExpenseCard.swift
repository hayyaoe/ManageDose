//
//  AddNewExpenseCard.swift
//  ManageDoseMac
//
//  Created by MacBook Pro on 06/06/24.
//

import SwiftUI
import SwiftData

struct AddNewExpenseCard: View {
    
//    @Environment(\.modelContext) private var context
    @Binding var allFieldsFilled: Bool
    @Binding var budgeting: BudgetingData
    var isIncome: Bool
    let category : String
    @State private var selectedOption = CategoryTransaction.electricity
    
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
        VStack{
            
            
            VStack(alignment: .leading){
                Text(isIncome ? "Add Income" : "Add Expense")
                    .foregroundColor(Color.black)
                    .font(.title2)
                    .fontWeight(.bold)
                HStack{
                    Image(icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height:50)
                        .foregroundStyle(.blue)
                        .padding(EdgeInsets(top:0, leading:0, bottom: 10, trailing: 0))
                    VStack(alignment: .leading){
                        Text("\(isIncome ? "Income" : "Expense") Name")
                            .foregroundColor(Color.black)
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .padding(.bottom, 4)
                        TextField("Food and Drink", text: $expenseName)
                            .font(.subheadline)
                            .foregroundColor(Color.black)
                            SeparatorBar()
                            .padding(.bottom, 8)
                    }
                }
                Text("\(isIncome ? "Income" : "Expense") Category")
                    .foregroundColor(Color.black)
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
//                    .keyboardType(.numberPad)
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
            }
            .padding()
        }
        .background(Color.white)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: BudgetingData.self, configurations: config)
        let example = BudgetingData(name: "Basic Needs", percentage: 50, budget: .dailyneeds, totalBudget: 3000000, used: 500)
        
        @State var budgetings = example
        
        return AddNewExpenseCard(allFieldsFilled: .constant(false), budgeting: $budgetings, isIncome: true, category: "Basic Needs")
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
