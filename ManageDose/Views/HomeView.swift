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
    
    @Query( sort: \TransactionData.date ) var transactions: [TransactionData]
    @Query( sort: \BudgetingData.name) var budgets: [BudgetingData]
    
    var budget: Int = 1000000
    
    var body: some View {
        
        NavigationView {
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
                            
                            HStack{
                                Text("Mei 2024")
                                    .fontWeight(.semibold)
                                    .font(.subheadline)
                                Image(systemName: "chevron.down")
                                    .bold()
                                    .font(.subheadline)
                            }
                            
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
                                    Text("Rp \(self.budget)")
                                        .foregroundStyle(.white)
                                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                        .bold()
                                }
                                
                                Spacer()
                                
                                NavigationLink(destination: SettingBudget(budget: budget, budgetings: budgets)) {
                                    Text("Atur Ulang")
                                        .foregroundStyle(.white)
                                        .font(.caption)
                                        .padding(8)
                                        .background(Color(red: 0.192, green: 0.106, blue: 0.702)
                                        .cornerRadius(18)
                                        )
                                    }
                                    .buttonStyle(PlainButtonStyle())
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
                                        Text("Rp. 2.989.999")
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
                                        Text("Rp. 420.699.9")
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
                                    BudgetingCard(budgetingData: budget)
                                }
                            }
                            .padding(EdgeInsets(top:0, leading:20, bottom: 0, trailing: 20))
                        }
                        .overlay {
                            if transactions.isEmpty {
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
                            ForEach(transactions) { transaction in
                                TransactionItem(transactionData: transaction)
                            }
                            
                        }.padding(.horizontal)
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 100, trailing: 0))
                    .overlay(alignment: .bottom) {
                        if transactions.isEmpty {
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
                                    //                                addTransactionSample()
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
    }
    
    func addBudgetingSample (){
        
        let data1 = BudgetingData(id: "NICE", name: "MEKDI", percentage: 0.4, budget: .dailyneeds)
        let data2 = BudgetingData(id: "COOK", name: "MEKDI", percentage: 0.3, budget: .wants)
        let data3 = BudgetingData(id: "BRU", name: "MEKDI", percentage: 0.3, budget: .saving)
        
        modelContext.insert(data1)
        modelContext.insert(data2)
        modelContext.insert(data3)
    }
    
//    func addTransactionSample (){
//        
//        let data4 = TransactionData(id: "BUDI", name: "XX1", date: Date(), amount: 20000, cashFlow: .expense, budget: .dailyneeds, categoryTransaction: .electricity)
//        let data5 = TransactionData(id: "GAMING", name: "XX2", date: Date(), amount: 20000, cashFlow: .income, budget: .wants, categoryTransaction: .electricity)
//        let data6 = TransactionData(id: "YEE", name: "XX3", date: Date(), amount: 20000, cashFlow: .expense, budget: .saving, categoryTransaction: .electricity)
//        
//        modelContext.insert(data4)
//        modelContext.insert(data5)
//        modelContext.insert(data6)
//    }
    
//    func availableBudget () -> Double{
//        ForEach(transactions) { transaction in
//        }
//        return 0.0
//    }
}


#Preview {
    Home()
}

