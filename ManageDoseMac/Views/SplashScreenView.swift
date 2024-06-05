//
//  SwiftUIView.swift
//  ManageDoseMac
//
//  Created by MacBook Pro on 05/06/24.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var isActive = false
    
    var body: some View {
        if isActive{
            ContentView()
        }else{
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
            }.onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}


#Preview {
    SwiftUIView()
}
