//
//  IncomeDetail.swift
//  ManageDose
//
//  Created by MacBook Pro on 26/05/24.
//

import SwiftUI

struct IncomeDetailView: View {
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                Text("Insert Insertion Source")
                    .font(.title3)
                    .fontWeight(.semibold)
                Text("Enter Your Income in one month")
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray)
            }
            .padding(.horizontal, 15)
            .frame(maxWidth: .infinity, alignment: .leading)
            Rectangle()
                .fill(Color(red: 220/255, green: 213/255, blue: 255/255, opacity: 1))
                .frame(width:400, height: 10)
                .offset(y: 8)
            ScrollView(.vertical, showsIndicators: false){
                LazyVStack(){
                    ExpenseCard()
                    ExpenseCard()
                    ExpenseCard()
                    ExpenseCard()
                    ExpenseCard()
                    ExpenseCard()
                    ExpenseCard()
                    ExpenseCard()
                    
                }
                
            }
            .overlay(
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
                    .offset(x: -10, y: 230)
            )
            
            Divider()
                .background(Color.gray)
                .frame(width:400)
                .offset(y: -8)
        
        
            HStack{
                Text("Total Income")
                    .font(.system(size: 18))
                    .fontWeight(.regular)
                    .foregroundStyle(.gray)
                
                Spacer()
                Text("Rp. 23.112.999")
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            .padding(.top, 0)
            CustomButton()
        }
        .padding(.horizontal, 15)
        .navigationBarTitle(Text("Detail Budget")
            .font(.title3)
            .fontWeight(.semibold)
        , displayMode: .inline)
        
    }
}

#Preview {
    IncomeDetailView()
}
