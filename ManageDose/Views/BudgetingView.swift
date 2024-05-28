//
//  BudgetingView.swift
//  ManageDose
//
//  Created by MacBook Pro on 22/05/24.
//

import SwiftUI

struct BudgetingView: View {
    var body: some View {
        VStack{
            HStack{
                Text("Budgeting")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .overlay(
                        Image(systemName: "bell.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .foregroundColor(Color(red: 99 / 255.0, green: 97 / 255.0, blue: 148 / 255.0))
                            .overlay(
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 12, height: 12)
                                    .offset(x: 12, y: -12)
                            )
                            .offset(x: 150)
                    )
            }
            ScrollView(.vertical, showsIndicators: false){
                LazyVStack(spacing: 20){
                    PieChart()
                    HStack{
                        Text("Expend Alocation")
                            .fontWeight(.semibold)
                            .font(.title3)
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 5, leading: 15, bottom: 0, trailing: 20))
                    NavigationLink(destination: DetailBudget()) {
                        BudgetProgressCard(colorAlert: "#1FCA9D")
                    }
                    BudgetProgressCard(colorAlert: "#5339EE")
                    BudgetProgressCard(colorAlert: "#E93700")
                }
                .padding(.horizontal)
            }
        }
        .navigationBarTitle("", displayMode: .inline)
    }
}

#Preview {
    BudgetingView()
}
