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
        GeometryReader { geometry in
            let screenWidth = geometry.size.width
            let isLargeScreen = screenWidth > 720
            NavigationStack{
                VStack{
                    ZStack{
                        Image("Ellipse 6")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: isLargeScreen ? 800: 420, height: isLargeScreen ? 800: 420)
                            .offset(x: isLargeScreen ? 300: 100, y: isLargeScreen ? -300: -103)
                        Image("mobile banking 1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: isLargeScreen ? 600 :  420, height: isLargeScreen ? 600 : 420)
                            .offset(x: 0, y: -40)
                        
                    }
                    HStack{
                        PageIndicatorFill()
                        PageIndicatorBlank()
                        PageIndicatorBlank()
                    }
                    
                    Text("Welcome To ManageDose!")
                        .font(.system(size: isLargeScreen ? 36 : 20))
                        .bold()
                        .padding(.vertical, 20)
                    Text("Manage your spendings on wants, needs, and savings!")
                        .font(.system(size: isLargeScreen ? 26 : 16))
                        .frame(maxWidth: isLargeScreen ? 500 : 360, alignment: .center)
                        .multilineTextAlignment(.center)
                    Button(action: {
                        hasSeenOnboarding = true
                    }) {
                        Text("Skip")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .font(.system(size: isLargeScreen ? 26 : 16))
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                            .background(Color.clear)
                            .cornerRadius(20)
                    }
                    
                    NavigationLink(destination: OnBoarding2View(), label: {                Text("Next")
                            .frame(maxWidth: isLargeScreen ? 800 : 320)
                            .padding()
                            .font(.system(size: isLargeScreen ? 26 : 16))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .background(Color(red: 83/255, green: 57/255, blue: 238/255))
                        .cornerRadius( isLargeScreen ? 40 : 20)})
                }
            }
        }
    }
}

#Preview {
    OnBoarding1View()
}
