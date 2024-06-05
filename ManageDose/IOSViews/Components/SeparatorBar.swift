//
//  SeparatorBar.swift
//  ManageDose
//
//  Created by RabiRabi Channel on 20/05/24.
//

import SwiftUI

struct SeparatorBar: View {
    var body: some View {
        Rectangle()
             .frame(height: 1) // Thickness of the separator
             .foregroundColor(Color.gray)
             .opacity(0.4)
    }
}

#Preview {
    SeparatorBar()
}
