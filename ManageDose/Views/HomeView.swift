//
//  HomeView.swift
//  ManageDose
//
//  Created by RabiRabi Channel on 20/05/24.
//

import SwiftUI
import SwiftData

struct Home: View {
    
    @Query( sort: \TransactionData.date ) var transactions: [TransactionData]
    @Query( sort: \BudgetingData.name) var budgets: [BudgetingData]
    
    var body: some View {
         
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
                        Text("Rp 2.989.999")
                            .foregroundStyle(.white)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .bold()
                    }
                    
                    Spacer()
                    
                    Text("Atur Ulang")
                        .foregroundStyle(.white)
                        .font(.caption)
                        .padding(8)
                        .background{
                            Color(red:0.19215686274509805,green:0.10588235294117647,blue:0.7019607843137254).cornerRadius(18)
                        }
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
                            BudgetingCard()
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
                                .frame(height: 50)
                                .foregroundStyle(.gray)
                            Text("Create Budgeting to see budgeting")
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
                        TransactionItem(transactionData: TransactionData(id: "Strong", name: "McDonald's", date: Date(), amount: 109000, type: .expense, budget: .dailyneeds))
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
                            .frame(height: 50)
                            .foregroundStyle(.gray)
                        Text("Add Transactions to see list")
                    }
                    
                }
            }
        }.ignoresSafeArea(.all)
    }
}

#Preview {
    Home()
}

