//
//  TransactionItem.swift
//  ManageDose
//
//  Created by RabiRabi Channel on 20/05/24.
//

import SwiftUI

struct TransactionItem: View {
    var body: some View {
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
        .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 0))
    }
}

#Preview {
    TransactionItem()
}
