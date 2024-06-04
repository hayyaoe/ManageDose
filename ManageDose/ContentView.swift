//
//  ContentView.swift
//  ManageDose
//
//  Created by RabiRabi Channel on 17/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false
    var body: some View {
        if hasSeenOnboarding {
            TabView(content: {
                Home()
                    .tag(1)
                    .tabItem{
                        Image(systemName: "house")
                                .imageScale(.large)
                                .foregroundStyle(Color(red: 83/255, green: 57/255, blue: 238/255, opacity: 1))
                    }
//                BudgetingView()
//                    .tag(1)
//                    .tabItem{
//                        Image(systemName: "house")
//                                .imageScale(.large)
//                                .foregroundStyle(Color(red: 83/255, green: 57/255, blue: 238/255, opacity: 1))
//                    }
                TransactionHistoryView()
                    .tag(3)
                    .tabItem {
                        Image(systemName: "menucard")
                                .imageScale(.large)
                                .foregroundStyle(Color(red: 83/255, green: 57/255, blue: 238/255, opacity: 1))
                    }
            })
        }else{
            OnBoarding1View()
        }
        

    }
}

#Preview {
    ContentView()
}
