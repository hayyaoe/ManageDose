//
//  IncomeItem.swift
//  ManageDose
//
//  Created by RabiRabi Channel on 31/05/24.
//

import SwiftUI
import SwiftData

struct IncomeItem: View {
    var incomeData: IncomeData
    
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
                Text(incomeData.name)
                    .fontWeight(.bold)
                    .font(.headline)
                Text(incomeData.category.rawValue)
                    .font(.subheadline)
          
            }
            
            Spacer()
            
            VStack(
                alignment: .trailing
            ){
        
                Text("Rp \(incomeData.amount,format: .number)")
                    .fontWeight(.bold)
                    .font(.headline)
                    .foregroundStyle(.green)
            

                Text(incomeData.date, style: .date)
                    .font(.subheadline)
            }
        }
        .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 0))
    }
}
