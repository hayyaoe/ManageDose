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
                let isLargeScreen = screenWidth > 720
                
                ZStack{
                    if !isLargeScreen {
                        Image("splash_screen")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 720, height: 720)
                    }
                    VStack (alignment: .center){
                        Spacer()
                        Image("managedose_logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: isLargeScreen ? 1000 : 390, height: isLargeScreen ? 600 : 390)
                        
                        Text("ManageDose")
                            .font(.system(size: isLargeScreen ? 40: 24))
                            .fontWeight(.bold).foregroundStyle(Color(.blue))
                            .offset(y:-50)
                        Spacer()
                    }
                }.onAppear {
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
