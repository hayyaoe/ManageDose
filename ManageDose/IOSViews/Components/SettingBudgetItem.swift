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
        if (name == "Wants"){
            HStack {
                HStack {
                    Text("\(percentage)%")
                        .font(.title2)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 20)
                        .foregroundColor(.white)
                        .background(Color(hex: "2E66363"))
                        .cornerRadius(8)
                    Text("\(name)")
                        .font(.subheadline)
                        .padding(.horizontal, 5)
                }
                Spacer()
                
                Text("Rp. \(amount)")
                    .font(.system(size: 18))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
            .padding(20)
            .background(Color(hex: "FCC5C5"))
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
                            return Color(hex: "FEAC28")
                        case "Savings":
                            return Color(hex: "2244A0")
                        default:
                            return Color(hex: "FEAC28")
                        }
                    }
                    .cornerRadius(8)
                
                VStack (alignment: .leading) {
                    Text("\(name)")
                        .font(.subheadline)
                    Text("Rp. \(amount)")
                        .font(.system(size: 18))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                .padding(.vertical, 2)
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 24)
            .background {
                switch name {
                case "Basic Needs":
                    return Color(hex: "FEF2E0")
                case "Savings":
                    return Color(hex: "BFD0FF")
                default:
                    return Color(hex: "FEF2E0")
                }
            }
            .cornerRadius(20)
            .shadow(radius: 1)
        }
    }
}

#Preview {
    SettingBudgetItem(percentage: 50, name: "Savings", amount: 3130000)
}
