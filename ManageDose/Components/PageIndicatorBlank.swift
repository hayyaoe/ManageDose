//
//  PageIndicatorBlank.swift
//  ManageDose
//
//  Created by student on 30/05/24.
//

import SwiftUI

struct PageIndicatorBlank: View {
    var body: some View {
        Rectangle()
            .frame(width: 10, height: 10)
            .foregroundColor(Color(red: 214/255, green: 214/255, blue: 214/255))
            .cornerRadius(10)
    }
}

#Preview {
    PageIndicatorBlank()
}
