//
//  NavBar.swift
//  ManageDose
//
//  Created by MacBook Pro on 28/05/24.
//

//import SwiftUI
//import SwiftData
//
//struct NavBar: View {
//    @Query private var budgetings: [BudgetingData]
//    @Query private var incomes: [IncomeData]
//    var body: some View {
//        HStack{
////            Button(action: {
////                
////            }){
////                Image(systemName: "house")
////                    .imageScale(.large)
////                    .foregroundStyle(Color(red: 83/255, green: 57/255, blue: 238/255, opacity: 1))
////            }
//            
//            NavigationLink(destination: Home(), label: {Image(systemName: "house")
//                    .imageScale(.large)
//                    .foregroundStyle(Color(red: 83/255, green: 57/255, blue: 238/255, opacity: 1))
//            })
//            
//            Spacer()
////            Button(action: {
////                
////            }){
////                Image(systemName: "newspaper")
////                    .imageScale(.large)
////                    .foregroundStyle(Color(red: 83/255, green: 57/255, blue: 238/255, opacity: 1))
////            }
//            
//            NavigationLink(destination: BudgetingView(budgetings: budgetings, budget: availableBudget() ), label: {
//                Image(systemName: "newspaper")
//                                    .imageScale(.large)
//                                    .foregroundStyle(Color(red: 83/255, green: 57/255, blue: 238/255, opacity: 1))
//            })
//            
//            Spacer()
//            
////            Button(action: {
////                
////            }){
////                Image(systemName: "menucard")
////                    .imageScale(.large)
////                    .foregroundStyle(Color(red: 83/255, green: 57/255, blue: 238/255, opacity: 1))
////            }
//            NavigationLink(destination: TransactionHistoryView(), label: {
//                Image(systemName: "menucard")
//                                    .imageScale(.large)
//                                    .foregroundStyle(Color(red: 83/255, green: 57/255, blue: 238/255, opacity: 1))
//            })
//            
//        }.padding(36)
//            .background(Color.white)
//            .clipShape(
//                .rect(
//                    topLeadingRadius: 36,
//                    topTrailingRadius: 36
//                )
//            )
//            .shadow(color: Color.black.opacity(0.15), radius: 4, x: 0, y: 0)
//    }
//    
//    private func availableBudget() -> Double {
//      var cumulativeIncome = 0.0
//
//      // Calculate cumulative income
//      for income in incomes {
//        cumulativeIncome += income.amount
//      }
//
//      // Return available budget
//      return cumulativeIncome
//    }
//}
//
//#Preview {
//    NavBar()
//}
