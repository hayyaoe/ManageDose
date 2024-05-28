//
//  AddButton.swift
//  ManageDose
//
//  Created by MacBook Pro on 26/05/24.
//

import SwiftUI

struct AddButton: View {
    var body: some View {
        HStack{
            Spacer()
            ZStack {
                Circle()
                    .fill(Color(red: 83/255, green: 57/255, blue: 238/255, opacity: 1))
                    .frame(width: 60, height: 60)
                Image(systemName: "plus")
                    .font(.title)
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    AddButton()
}
