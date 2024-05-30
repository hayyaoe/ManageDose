//
//  OnBoarding2View.swift
//  ManageDose
//
//  Created by student on 30/05/24.
//

import SwiftUI

struct OnBoarding2View: View {
    var body: some View {
        VStack{
            ZStack{
                Image("Ellipse 7")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 420, height: 420)
                    .offset(x: 130, y: -200)
                Image("digital wallet 1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 360, height: 360)
                    .offset(x: 0, y: 0)
                
            }
            HStack{
                PageIndicatorBlank()
                PageIndicatorFill()
                PageIndicatorBlank()
            }
            Text("Manage Your Cash Flow")
                .font(.title2)
                .bold()
                .padding(.vertical, 20)
            Text("Add, delete, and manage your income as well as expenditure!")
                .font(.subheadline)
                .frame(maxWidth: 260, alignment: .center)
                .multilineTextAlignment(.center)
            Button(action: {
                
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
            Button(action: {
                
            }) {
                Text("Next")
                    .frame(maxWidth: 320)
                    .padding()
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .background(Color(red: 83/255, green: 57/255, blue: 238/255))
                    .cornerRadius(20)
            }
        }
    }
}

#Preview {
    OnBoarding2View()
}
