//
//  Slider.swift
//  ManageDose
//
//  Created by MacBook Pro on 25/05/24.
//

import SwiftUI

struct Slider: View {
    var totalWidth: CGFloat
    @Binding var width: CGFloat
    @Binding var width1: CGFloat
//    var totalWidth = UIScreen.main.bounds.width - 60
//    @State var width: CGFloat = (UIScreen.main.bounds.width - 60) * 0.5
//    @State var width1: CGFloat = (UIScreen.main.bounds.width - 60) * 0.8
    var body: some View {
        VStack {
            ZStack (alignment: .leading) {
                Rectangle()
                    .fill(Color.black.opacity(0.20))
                    .frame(width: totalWidth, height: 6)
                Rectangle()
                    .fill(Color.yellow)
                    .frame(width: self.width, height: 6)
                Rectangle()
                    .fill(Color.red)
                    .frame(width: self.width1 - self.width, height: 6)
                    .offset(x: self.width + 9)
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: totalWidth - self.width1, height: 6)
                    .offset(x: self.width1 + 18)
                HStack (spacing: 0) {
                    Circle()
                        .fill(Color.yellow)
                        .frame(width: 18, height: 18)
                        .overlay(
                            Circle()
                                .stroke(.white, lineWidth: 6)
                        )
                        .offset(x: self.width - 9)
                        .gesture(
                            DragGesture()
                                .onChanged({ (value) in
                                    if value.location.x >= 0 && value.location.x <= self.width1 {
                                        self.width = value.location.x
                                    }
                                })
                        )
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 18, height: 18)
                        .overlay(
                            Circle()
                                .stroke(.white, lineWidth: 6)
                        )
                        .offset(x: self.width1 - 9)
                        .gesture(
                            DragGesture()
                                .onChanged({ (value) in
                                    if value.location.x <= self.totalWidth && value.location.x >= self.width {
                                        self.width1 = value.location.x
                                    }
                                })
                        )
                }
            }
        }
    }
    
    func getValue(val: CGFloat) -> String {
        return String(format: "%.0f", val)
    }
}

#Preview {
    Slider(totalWidth: UIScreen.main.bounds.width - 60, width: .constant((UIScreen.main.bounds.width - 60) * 0.5), width1: .constant((UIScreen.main.bounds.width - 60) * 0.8))
}

