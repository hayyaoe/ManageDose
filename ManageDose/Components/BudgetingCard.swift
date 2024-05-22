//
//  BudgetingCard.swift
//  ManageDose
//
//  Created by RabiRabi Channel on 20/05/24.
//

import SwiftUI

struct BudgetingCard: View {
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 4
        ){
            Image(systemName: "checkmark.square.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height:60)
                .foregroundStyle(.blue)
                .padding(EdgeInsets(top:0, leading:0, bottom: 10, trailing: 0))
            Text("Basic Needs")
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundStyle(.gray)
            Text("Rp. 3.343.000")
                .fontWeight(.bold)
                .font(.subheadline)
                .truncationMode(.tail)
                .lineLimit(1)
        }
        .frame(width: 110, height: 110)
        .padding(15)
        .background(Color.white)
        .cornerRadius(18)
        .shadow(color: Color.black.opacity(0.15), radius: 4, x: 0, y: 0)
        
    }
}

#Preview {
    BudgetingCard()
}
