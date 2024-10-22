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
    
    private var image: String {
        switch incomeData.categoryTransaction {
        case .salary:
            return "income"
        case .otherIncome:
            return "income"
        case .food:
            return "food"
        case .electricity:
            return "dailyneeds"
        case .investment:
            return "investment"
        case .retirement:
            return "retirement"
        case .entertainment:
            return "entertainment"
        case .shopping:
            return "shopping"
        }
    }

    
    var body: some View {
        if UIDevice.current.userInterfaceIdiom == .pad{
            HStack{
                Image("income")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.yellow)
                    .frame(height: 70)
                
                VStack(
                    alignment: .leading
                ){
                    Text("\(incomeData.name)")
                        .fontWeight(.bold)
                        .font(.title2)
                        .foregroundColor(.black)
                    Text("\(incomeData.categoryTransaction.rawValue)")
                        .font(.title3)
                        .foregroundColor(.black)
              
                }
                
                Spacer()
                
                VStack(
                    alignment: .trailing
                ){
            
                    Text("+ Rp \(incomeData.amount,format: .number)")
                        .fontWeight(.bold)
                        .font(.title2)
                        .foregroundStyle(.green)
                

                    Text(incomeData.date, style: .date)
                        .font(.title3)
                        .foregroundColor(.black)
                }
            }
            .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 0))
        }else{
            HStack{
                Image("income")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.yellow)
                    .frame(height: 50)
                
                VStack(
                    alignment: .leading
                ){
                    Text("\(incomeData.name)")
                        .fontWeight(.bold)
                        .font(.headline)
                        .foregroundColor(.black)
                    Text("\(incomeData.categoryTransaction.rawValue)")
                        .font(.subheadline)
                        .foregroundColor(.black)
              
                }
                
                Spacer()
                
                VStack(
                    alignment: .trailing
                ){
            
                    Text("+ Rp \(incomeData.amount,format: .number)")
                        .fontWeight(.bold)
                        .font(.headline)
                        .foregroundStyle(.green)
                

                    Text(incomeData.date, style: .date)
                        .font(.subheadline)
                        .foregroundColor(.black)
                }
            }
            .padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 0))
        }
        
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: IncomeData.self, configurations: config)
        
        let exampleIncome = IncomeData(
            name: "Monthly Salary",
            date: Date(),
            amount: 5000000,
            categoryTransaction: .salary
        )
        
        return IncomeItem(incomeData: exampleIncome)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
