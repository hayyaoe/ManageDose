//
//  AddNewExpenseCard.swift
//  ManageDose
//
//  Created by student on 24/05/24.
//

import SwiftUI

struct AddNewExpenseCard: View {
    var body: some View {
        VStack(
            spacing: 8
        ){
            PopUpBar()
                .padding(.bottom, 24)
            
            VStack(alignment: .leading){
                Text("Add Expense")
                    .bold()
                    .font(.headline)
                    .padding(.bottom, 12)
                HStack(
                    spacing: 24
                ){
                    Image(systemName: "checkmark.square.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height:50)
                        .foregroundStyle(.blue)
                        .padding(EdgeInsets(top:0, leading:0, bottom: 10, trailing: 0))
                    VStack(alignment: .leading){
                        Text("Expense Category")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .padding(.bottom, 4)
                        Text("Food and Drink")
                            .font(.caption)
                            .foregroundStyle(.gray)
                        SeparatorBar()
                            .padding(.bottom, 8)
                        
                    }
                }
                
                Text("Expense Name")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .padding(.bottom, 4)
                Text("Ex: Denver Food")
                    .font(.caption)
                    .foregroundStyle(.gray)
                SeparatorBar()
                    .padding(.bottom, 8)
                
                Text("Expense Amount")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .padding(.bottom, 4)
                Text("Rp 0")
                    .font(.caption)
                SeparatorBar()
                    .padding(.bottom, 8)
                
                Text("Expense Date")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .padding(.bottom, 4)
                Text("24 May 2024")
                    .font(.caption)
                SeparatorBar()
                    .padding(.bottom, 8)
                
                //                Text("Basic Needs")
                //                    .font(.subheadline)
                //                    .foregroundStyle(.gray)
                //                Text("Rp. 3.343.000")
                //                    .fontWeight(.bold)
                //                    .font(.subheadline)
                //                    .truncationMode(.middle)
            }
            
            
        }
        .padding(15)
        .background(Color.white)
        .clipShape(
            .rect(
                topLeadingRadius: 36,
                topTrailingRadius: 36
            )
        )
        .shadow(color: Color.black.opacity(0.15), radius: 4, x: 0, y: 0)
        
    }
}

#Preview {
    AddNewExpenseCard()
}
