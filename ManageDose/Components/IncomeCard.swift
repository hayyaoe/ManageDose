//
//  IncomeCard.swift
//  ManageDose
//
//  Created by MacBook Pro on 26/05/24.
//

import SwiftUI

struct IncomeCard: View {
    let incomeName: String
    let incomeCategory: CategoryTransaction
    let incomeAmount: Double
    let incomeDate: Date
    
    var body: some View {
        if UIDevice.current.userInterfaceIdiom == .pad{
            HStack{
                HStack{
                    Image("income")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(.yellow)
                        .frame(height: 70)
                    
                    VStack(
                        alignment: .leading
                    ){
                        Text(incomeName)
                            .fontWeight(.bold)
                            .font(.title2)
                        Text(incomeCategory.rawValue)
                            .font(.title3)
                    }
                    
                    Spacer()
                    
                    VStack(
                        alignment: .trailing
                    ){
                        Text("+ Rp. \(String(format: "%.2f", incomeAmount))")
                            .fontWeight(.bold)
                            .font(.title2)
                            .foregroundStyle(.green)
                        Text(incomeDate, style: .date)
                            .font(.title3)
                    }
                }
                .background(Color.white)
                .padding(15)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 211/255, green: 209/255, blue: 209/255, opacity: 1), lineWidth: 1)
                )
            }
            .padding(.top, 5)
        }else{
            HStack{
                HStack{
                    Image("income")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(.yellow)
                        .frame(height: 50)
                    
                    VStack(
                        alignment: .leading
                    ){
                        Text(incomeName)
                            .fontWeight(.bold)
                            .font(.headline)
                        Text(incomeCategory.rawValue)
                            .font(.subheadline)
                    }
                    
                    Spacer()
                    
                    VStack(
                        alignment: .trailing
                    ){
                        Text("+ Rp. \(String(format: "%.2f", incomeAmount))")
                            .fontWeight(.bold)
                            .font(.headline)
                            .foregroundStyle(.green)
                        Text(incomeDate, style: .date)
                            .font(.subheadline)
                    }
                }
                .background(Color.white)
                .padding(15)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 211/255, green: 209/255, blue: 209/255, opacity: 1), lineWidth: 1)
                )
            }
            .padding(.top, 5)
        }
        
    }
}

#Preview {
    IncomeCard(incomeName: "McDonad's", incomeCategory: .electricity, incomeAmount: 69.42, incomeDate: Date())
}
