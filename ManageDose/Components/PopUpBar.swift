//
//  PopUpBar.swift
//  ManageDose
//
//  Created by student on 24/05/24.
//

import SwiftUI

struct PopUpBar: View {
    var body: some View {
        Rectangle()
            .frame(width: 64, height: 6) // Thickness of the separator
            .foregroundColor(Color.gray)
            .opacity(0.3)
            .cornerRadius(5)
    }
}

#Preview {
    PopUpBar()
}
