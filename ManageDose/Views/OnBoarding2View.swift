//
//  OnBoarding2View.swift
//  ManageDose
//
//  Created by student on 30/05/24.
//

import SwiftUI

struct OnBoarding2View: View {
    
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            let screenWidth = geometry.size.width
            let isLargeScreen = screenWidth > 720
            
            NavigationStack {
                Spacer()
                
                VStack {
                    ZStack {
                        Image("Ellipse 7")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: isLargeScreen ? 800 : 420, height: isLargeScreen ? 800 : 420)
                            .offset(x: isLargeScreen ? 400 : 130, y: isLargeScreen ? -300 : -200)
                        
                        Image("digital wallet 1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: isLargeScreen ? 600 : 320, height: isLargeScreen ? 600 : 320)
                            .offset(x: 0, y: 0)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.5)

                    HStack {
                        PageIndicatorBlank()
                        PageIndicatorFill()
                        PageIndicatorBlank()
                    }
                    
                    Text("Manage Your Cash Flow")
                        .font(.system(size: isLargeScreen ? 36 : 20))
                        .bold()
                        .padding(.vertical, 20)
                    
                    Text("Add, delete, and manage your income as well as expenditure!")
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
                    
                    NavigationLink(destination: OnBoarding3View(), label: {
                        Text("Next")
                            .frame(maxWidth: isLargeScreen ? 800 : 320)
                            .padding()
                            .font(.system(size: isLargeScreen ? 26 : 16))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .background(Color(red: 83/255, green: 57/255, blue: 238/255))
                            .cornerRadius(isLargeScreen ? 40 : 20)
                    })
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

#Preview {
    OnBoarding2View()
}
