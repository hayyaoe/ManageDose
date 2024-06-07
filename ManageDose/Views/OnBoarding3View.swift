//
//  OnBoarding3View.swift
//  ManageDose
//
//  Created by student on 30/05/24.
//

import SwiftUI

struct OnBoarding3View: View {
    
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            let screenWidth = geometry.size.width
            let isLargeScreen = screenWidth > 720
            
            NavigationStack {
                Spacer()
                VStack {
                    ZStack {
                        Image("Ellipse 9")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: isLargeScreen ? 1400 : 420, height: isLargeScreen ? 810 : 420)
                            .offset(x: isLargeScreen ? 0 : 0, y: isLargeScreen ? -300 : -180)
                        
                        Image("money 1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: isLargeScreen ? 500 : 320, height: isLargeScreen ? 500 : 320)
                    }
                    .frame(width: screenWidth)
                    HStack {
                        PageIndicatorBlank()
                        PageIndicatorBlank()
                        PageIndicatorFill()
                    }

                    Text("Utilize The 50/30/20 Rule")
                        .font(.system(size: isLargeScreen ? 36 : 20))
                        .bold()
                        .padding(.vertical, 20)
                    
                    Text("50% into basic needs, 30% into wants, and 20% into savings, or set your own proportions!")
                        .font(.system(size: isLargeScreen ? 26 : 16))
                        .frame(maxWidth: isLargeScreen ? 500 : 360)
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        hasSeenOnboarding = true
                    }) {
                        Text("Continue")
                            .frame(maxWidth: isLargeScreen ? 800 : 320)
                            .padding()
                            .font(.system(size: isLargeScreen ? 26 : 16))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .background(Color(red: 83/255, green: 57/255, blue: 238/255))
                            .cornerRadius(isLargeScreen ? 40 : 20)
                    }
                    .padding(.top, 30)
                    
                    Spacer() // Spacer at the bottom for vertical centering
                }
                .frame(width: geometry.size.width, height: geometry.size.height) // Full screen size
                .edgesIgnoringSafeArea(.all) // Ensure content is full screen
            }
        }
    }
}


#Preview {
    OnBoarding3View()
}
