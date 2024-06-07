//
//  OnBoarding1View.swift
//  ManageDose
//
//  Created by student on 30/05/24.
//

import SwiftUI

struct OnBoarding1View: View {
    
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack{
                ZStack{
                    Image("Ellipse 6")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 420, height: 420)
                        .offset(x: 100, y: -103)
                    Image("mobile banking 1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 420, height: 420)
                        .offset(x: 0, y: -40)
                    
                }
                HStack{
                    PageIndicatorFill()
                    PageIndicatorBlank()
                    PageIndicatorBlank()
                }
                Text("Welcome To ManageDose!")
                    .font(.title2)
                    .bold()
                    .padding(.vertical, 20)
                Text("Manage your spendings on wants, needs, and savings!")
                    .font(.subheadline)
                    .frame(maxWidth: 360, alignment: .center)
                    .multilineTextAlignment(.center)
                Button(action: {
                    hasSeenOnboarding = true
                }) {
                    Text("Skip")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                        .background(Color.clear)
                        .cornerRadius(20)
                }
                
                NavigationLink(destination: OnBoarding2View(), label: {                Text("Next")
                        .frame(maxWidth: 320)
                        .padding()
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .background(Color(red: 83/255, green: 57/255, blue: 238/255))
                        .cornerRadius(20)})
            }
        }
    }
}

#Preview {
    OnBoarding1View()
}
