//
//  OnBoarding1View.swift
//  ManageDoseMac
//
//  Created by MacBook Pro on 05/06/24.
//

import SwiftUI

struct OnBoarding1View: View {
    
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false
    
    var body: some View {
        ZStack{
            
            
            //        NavigationView(content: {
            Image("Ellipse 6")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 420, height: 420)
                .offset(x: 360, y: -270)
//                .rotationEffect(.degrees(24))
            Image("Ellipse 6")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 420, height: 420)
                .offset(x: -360, y: 270)
                .rotationEffect(.degrees(0))
            HStack(spacing: 40) { // Added spacing between elements
            
                
                
                VStack{
                    Image("mobile banking 1")
                }

                VStack(spacing: 20) { // Added spacing between text and buttons
                    
                    Text("Welcome To ManageDose!")
                        .font(.title2)
                        .bold()
                        .padding(.vertical, 20)
                        .foregroundColor(Color.black)
                    Text("Manage your spendings on wants, needs, and savings!")
                        .font(.subheadline)
                        .frame(maxWidth: 360, alignment: .center)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.black)
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
                    
                    NavigationLink(destination: OnBoarding2View(), label: {
                        Text("Next")
                            .frame(maxWidth: 320)
                            .padding()
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .background(Color(red: 83/255, green: 57/255, blue: 238/255))
                            .cornerRadius(20)
                    })
                }
            }
            .padding(48)
            .background(Color.white)
            //        })
        }.background(Color.white)
    }
}



#Preview {
    OnBoarding1View()
}
