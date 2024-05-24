//
//  AddNewExpenseView.swift
//  ManageDose
//
//  Created by student on 24/05/24.
//

import SwiftUI

struct AddNewExpenseView: View {
    var body: some View {
        Button(action: {
            // Your button action here
        }) {
            Text("Add New Transaction")
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(48)

        }
        .padding()

        Spacer()
        AddNewExpenseCard()
    }
}

#Preview {
    AddNewExpenseView()
}
