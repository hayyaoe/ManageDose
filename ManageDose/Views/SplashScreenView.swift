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
            GeometryReader { geometry in
                let screenWidth = geometry.size.width
                let screenHeight = geometry.size.height
                let isLargeScreen = screenWidth > 720
                
                ZStack {
                    if !isLargeScreen {
                        Image("splash_screen")
                    }
                    
                    VStack {
                        Spacer()
                        
                        Image("managedose_logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: isLargeScreen ? 500 : 420, height: isLargeScreen ? 500 : 420)
                        
                        Text("ManageDose")
                            .font(.system(size: isLargeScreen ? 40 : 24))
                            .fontWeight(.bold)
                            .foregroundColor(Color(hex: "5339EE"))
                            .padding(.top, -40)
                        
                        Spacer()
                    }
                    .frame(width: screenWidth)
                    .offset(x: isLargeScreen ? 0 : -20, y: isLargeScreen ? -40: -60)
                }
                .ignoresSafeArea()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation {
                            self.isActive = true
                        }
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
