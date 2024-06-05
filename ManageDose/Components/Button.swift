//
//  Button.swift
//  ManageDose
//
//  Created by MacBook Pro on 26/05/24.
//

import SwiftUI

struct CustomButton: View {
    var body: some View {
        Button(action: {
            // Tambahkan aksi untuk tombol di sini
            print("Button tapped")
        }) {
            Text("Submit")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(red: 83/255, green: 57/255, blue: 238/255, opacity: 1))
                .cornerRadius(40)
        }
        
        
    }
}

#Preview {
    CustomButton()
}
