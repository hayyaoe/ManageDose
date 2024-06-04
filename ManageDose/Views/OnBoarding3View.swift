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
        VStack{
            ZStack{
                Image("Ellipse 9")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 420, height: 420)
                    .offset(x: 0, y: -200)
                Image("money 1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 320, height: 320)
                    .offset(x: 0, y: 0)
                
            }
            HStack{
                PageIndicatorBlank()
                PageIndicatorBlank()
                PageIndicatorFill()
            }
            Text("Utilize The 50/30/20 Rule")
                .font(.title2)
                .bold()
                .padding(.vertical, 20)
            Text("50% into basic needs, 30% into wants, and 20% into savings, or set your own proportions!")
                .font(.subheadline)
                .frame(maxWidth: 360, alignment: .center)
                .multilineTextAlignment(.center)
    
            Button(action: {
                hasSeenOnboarding = true
            }) {
                Text("Continue")
                    .frame(maxWidth: 320)
                    .padding()
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .background(Color(red: 83/255, green: 57/255, blue: 238/255))
                    .cornerRadius(20)
            }
            .padding(.top, 60)
        }
    }
}

#Preview {
    OnBoarding3View()
}
