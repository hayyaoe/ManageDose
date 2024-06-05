//
//  PageIndicatorFill.swift
//  ManageDoseMac
//
//  Created by MacBook Pro on 05/06/24.
//

import SwiftUI

struct PageIndicatorFill: View {
    var body: some View {
        Rectangle()
            .frame(width: 24, height: 10)
            .foregroundColor(Color(red: 83/255, green: 57/255, blue: 238/255))
            .cornerRadius(10)
    }
}


#Preview {
    PageIndicatorFill()
}
