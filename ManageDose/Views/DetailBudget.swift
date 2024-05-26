//
//  DetailBudget.swift
//  ManageDose
//
//  Created by MacBook Pro on 25/05/24.
//

import SwiftUI

struct DetailBudget: View {
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
                    ExpenseCard()
                    ExpenseCard()
                    ExpenseCard()
                    ExpenseCard()
                    ExpenseCard()
                    ExpenseCard()
                    ExpenseCard()
                    ExpenseCard()
                    
                }
                
            }
            .overlay(
                HStack{
                    Spacer()
                    ZStack {
                        Circle()
                            .fill(Color(red: 83/255, green: 57/255, blue: 238/255, opacity: 1))
                            .frame(width: 60, height: 60)
                        Image(systemName: "plus")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                }
                    .offset(x: -10, y: 190)
            )
        }
        .padding(.horizontal, 15)
        .navigationBarTitle(Text("Detail Budget")
            .font(.title3)
            .fontWeight(.semibold)
        , displayMode: .inline)
    }
}

#Preview {
    DetailBudget()
}

//Spacer()
//            HStack{
//                Spacer()
//                ZStack {
//                    Circle()
//                        .fill(Color(red: 83/255, green: 57/255, blue: 238/255, opacity: 1))
//                        .frame(width: 60, height: 60)
//                    Image(systemName: "plus")
//                        .font(.title)
//                        .foregroundColor(.white)
//                }
//            }
