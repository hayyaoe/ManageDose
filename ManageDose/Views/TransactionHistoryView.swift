//
//  TransactionHistoryView.swift
//  ManageDose
//
//  Created by RabiRabi Channel on 20/05/24.
//

import SwiftUI

struct TransactionHistoryView: View {
    var body: some View {
        VStack{
            HStack{
                Text("Transaction History")
                    .font(.title3)
                    .fontWeight(.semibold)
                Spacer()
                Text("Filter")
                    .font(.title3)
                    .foregroundStyle(.blue)
                Image(systemName:"line.3.horizontal.decrease.circle")
                    .font(.title3)
                    .foregroundStyle(.blue)
            }.padding()
            ScrollView(.vertical, showsIndicators: false){
                LazyVStack{
                    TransactionItem()
                    SeparatorBar()
                    TransactionItem()
                    SeparatorBar()
                    TransactionItem()
                    SeparatorBar()
                    TransactionItem()
                    SeparatorBar()
                    TransactionItem()
                    SeparatorBar()
                    TransactionItem()
                    SeparatorBar()
                    TransactionItem()
                    SeparatorBar()
                    TransactionItem()
                    SeparatorBar()
                    TransactionItem()
                    SeparatorBar()
                    TransactionItem()
                    SeparatorBar()
                    TransactionItem()
                }.padding(.horizontal)
            }
        }
    }
}

#Preview {
    TransactionHistoryView()
}
