//
//  SplashScreen.swift
//  ManageDose
//
//  Created by RabiRabi Channel on 30/05/24.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack{
            Image("splash_screen")
            VStack{
                Image("managedose_logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 390)
                
                Text("ManageDose").font(.largeTitle).fontWeight(.bold).foregroundStyle(Color(.blue))
                    .offset(y:-50)
            }
        }

    }
}

#Preview {
    SplashScreen()
}
