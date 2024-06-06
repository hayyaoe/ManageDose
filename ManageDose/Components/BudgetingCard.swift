//
//  BudgetingCard.swift
//  ManageDose
//
//  Created by RabiRabi Channel on 20/05/24.
//

import SwiftUI
import SwiftData

struct BudgetingCard: View {
    
    @Environment(\.modelContext) private var modelContext
    var budgetingData: BudgetingData
    var budgetAvailable: Double
    var expenseData: [ExpenseData] = []
    
    var icon: String {
        switch budgetingData.budget {
        case .dailyneeds:
            return "basic needs"
        case .wants:
            return "wants"
        case .saving:
            return "savings"
        }
    }
    
    var body: some View {
        if UIDevice.current.userInterfaceIdiom == .pad{
            VStack(
                alignment: .leading,
                spacing: 4
            ){
                Image(icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height:80)
                    .padding(EdgeInsets(top:0, leading:0, bottom: 10, trailing: 0))
                Text(budgetingData.name)
                    .font(.system(size:15))
                    .fontWeight(.medium)
                    .foregroundStyle(.gray)
                Text("Rp \(budgetingData.amount, format: .number)")
                    .fontWeight(.bold)
                    .font(.system(size:20))
                    .truncationMode(.tail)
                    .lineLimit(1)
                    .foregroundColor(.black)
            }
            .frame(width: 150, height: 150)
            .padding(15)
            .background(Color.white)
            .cornerRadius(18)
            .shadow(color: Color.black.opacity(0.15), radius: 4, x: 0, y: 0)
        }else{
            VStack(
                alignment: .leading,
                spacing: 4
            ){
                Image(icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height:60)
                    .padding(EdgeInsets(top:0, leading:0, bottom: 10, trailing: 0))
                Text(budgetingData.name)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundStyle(.gray)
                Text("Rp \(budgetingData.amount, format: .number)")
                    .fontWeight(.bold)
                    .font(.subheadline)
                    .truncationMode(.tail)
                    .lineLimit(1)
                    .foregroundColor(.black)
            }
            .frame(width: 110, height: 110)
            .padding(15)
            .background(Color.white)
            .cornerRadius(18)
            .shadow(color: Color.black.opacity(0.15), radius: 4, x: 0, y: 0)
        }
        
        
    }
    
        
        private func calculateUsage() -> Double {
          expenseData.filter { $0.budget == budgetingData.budget }
                    .reduce(0.0, { $0 + $1.amount })
        }
        
}

//struct BudgetingCard_Preview: PreviewProvider {
//    static var previews: some View {
//        let budgetingData = BudgetingData( name: "Name", percentage: 0.7, budget: .dailyneeds, totalBudget: 1000, used: 500)
//        BudgetingCard(budgetingData: budgetingData, budgetAvailable: 100000000)
//    }
//}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: BudgetingData.self, configurations: config)
        let example = BudgetingData(name: "Basic Needs", percentage: 50, budget: .dailyneeds, totalBudget: 3000000, used: 500)
        
        @State var budgetings = example
        
        return BudgetingCard(budgetingData: budgetings, budgetAvailable: 3000000)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}


//#Preview{
//    BudgetingCard()
//}

