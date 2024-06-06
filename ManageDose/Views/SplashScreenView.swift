//
//  SplashScreen.swift
//  ManageDose
//
//  Created by RabiRabi Channel on 30/05/24.
//

import SwiftUI
import SwiftData

struct SplashScreen: View {
    @State private var isActive = false
    
    @Query var incomes: [IncomeData]
    @Query var expenses: [ExpenseData]
    @Query var budgets: [BudgetingData]
    
    var body: some View {
        #if os(watchOS)
        Group {
            if isActive {
                ContentView(incomes: .constant(self.incomes), expenses: .constant(self.expenses), budgets: .constant(self.budgets))
            } else {
                ZStack {
                    Color.white
                        .ignoresSafeArea()

                    VStack {
                        Image("logo new 1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            
                        Text("ManageDose")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(Color(hex: "5339EE"))
                    }
                    .offset(y: -15)
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
        }
        #else
        
        if isActive{
            ContentView(incomes: .constant(self.incomes), expenses: .constant(self.expenses), budgets: .constant(self.budgets))
        }else{
            ZStack{
                Image("splash_screen")
                VStack{
                    Image("managedose_logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 390)
                    
                    Text("ManageDose").font(.largeTitle).fontWeight(.bold).foregroundStyle(Color(.blue))
                        .offset(y:-50)
                }
            }.onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
        #endif
    }
}

#Preview {
    SplashScreen()
}
