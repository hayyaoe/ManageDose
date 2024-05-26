//
//  ExpenseCard.swift
//  ManageDose
//
//  Created by MacBook Pro on 25/05/24.
//

import SwiftUI

struct ExpenseCard: View {
    var body: some View {
        HStack{
            HStack{
                Image(systemName: "tag.square")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.yellow)
                    .frame(height: 50)
                
                VStack(
                    alignment: .leading
                ){
                    Text("McDonad's")
                        .fontWeight(.bold)
                        .font(.headline)
                    Text("Basic Needs")
                        .font(.subheadline)
              
                }
                
                Spacer()
                
                VStack(
                    alignment: .trailing
                ){
                    Text("- Rp. 69.420")
                        .fontWeight(.bold)
                        .font(.headline)
                        .foregroundStyle(.red)
                    Text("19 Mei 2024")
                        .font(.subheadline)
                }
            }
            .background(Color.white)
            .padding(15)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(red: 211/255, green: 209/255, blue: 209/255, opacity: 1), lineWidth: 1)
            )
        }
        .padding(.top, 10)
    }
}

#Preview {
    ExpenseCard()
}
