//
//  SettingBudget.swift
//  ManageDose
//
//  Created by MacBook Pro on 24/05/24.
//

import SwiftUI

struct SettingBudget: View {
    @State private var width: CGFloat = (UIScreen.main.bounds.width - 60) * 0.5
    @State private var width1: CGFloat = (UIScreen.main.bounds.width - 60) * 0.8
    @State private var budget = 2000000
    
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        let totalWidth = UIScreen.main.bounds.width - 60
        let basicNeedsPercentage = ((width / totalWidth) * 100).rounded()
        let savingsPercentage = (((width1 - width) / totalWidth) * 100).rounded()
        let wantsPercentage = (((totalWidth - width1) / totalWidth) * 100).rounded()
        VStack (alignment: .leading){
            Text("Spending Budget")
                .font(.title3)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Text("Enter your spending budget in one month.")
                .fontWeight(.light)
            Spacer().frame(height: 10)
            HStack{
                Text("Rp.")
                    .font(.title2)
                Text("\(self.budget)")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
        }
        
        Rectangle()
            .frame(height: 10)
            .foregroundColor(Color(hex: "DCD5FF"))
        
        Spacer()
        
        VStack (alignment: .leading){
            Text("Expend Allocation")
                .font(.system(size: 20))
            HStack (spacing: 20){
                Image(systemName:"line.3.horizontal.decrease.circle")
                    .font(.title3)
                Text("Tip: You can adjust your budget by sliding the slider.")
            }
            .frame(maxWidth: .infinity)
            .padding(10)
            .background(Color(hex: "FEF2E0"))
            .foregroundColor(Color(hex: "DF9723"))
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(hex: "DF9723"), lineWidth: 2)
            )
            
            Spacer().frame(height: 20)
            
            Slider(totalWidth: totalWidth, width: $width, width1: $width1)
            
            SettingBudgetRow(basicNeedsPercentage: .constant(basicNeedsPercentage), wantsPercentage: .constant(wantsPercentage), savingsPercentage: .constant(savingsPercentage), budget: .constant(self.budget))
            Spacer()
        }
        .padding(20)
        
        CustomButton()
            .padding(20)
        
//        Button(action: {
//            
//        }) {
//            Text("Save Budget")
//                .frame(maxWidth: .infinity)
//                .padding()
//                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                .foregroundColor(.white)
//                .background(Color.purple)
//                .cornerRadius(20)
//        }
//        .padding(20)
        
        Spacer()
    }
}

#Preview {
    SettingBudget()
}
