//
//  SettingBudgetItem.swift
//  ManageDose
//
//  Created by MacBook Pro on 24/05/24.
//

import SwiftUI

struct SettingBudgetItem: View {
    let percentage: Int
    let name: String
    let amount: Int
    
    var body: some View {
        if (name == "Savings"){
            HStack {
                HStack {
                    Text("\(percentage)%")
                        .font(.title2)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 20)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(8)
                    Text("\(name)")
                        .font(.subheadline)
                }
                Spacer()
                Text("Rp. \(amount)")
                    .font(.system(size: 18))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
            }
            .padding(20)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(radius: 1)
        } else {
            VStack (alignment: .leading) {
                Text("\(percentage)%")
                    .font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 20)
                    .foregroundColor(.white)
                    .background {
                        switch name {
                        case "Basic Needs":
                            return Color.yellow
                        case "Wants":
                            return Color.red
                        default:
                            return Color.yellow
                        }
                    }
                    .cornerRadius(8)
                
                VStack (alignment: .leading) {
                    Text("\(name)")
                        .font(.subheadline)
                    Text("Rp. \(amount)")
                        .font(.system(size: 18))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }.padding(.vertical, 2)
                
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 28)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(radius: 1)
        }
    }
}

#Preview {
    SettingBudgetItem(percentage: 50, name: "Wants", amount: 3130000)
}
