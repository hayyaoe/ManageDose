//
//  BudgetProgressCard.swift
//  ManageDose
//
//  Created by MacBook Pro on 22/05/24.
//

import SwiftUI

struct TopCornersRoundedShape: Shape {
    var radius: CGFloat

    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Mulai dari pojok kiri bawah
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        // Garis lurus ke pojok kiri atas
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + radius))
        // Kurva untuk sudut kiri atas
        path.addArc(center: CGPoint(x: rect.minX + radius, y: rect.minY + radius),
                    radius: radius,
                    startAngle: Angle(degrees: 180),
                    endAngle: Angle(degrees: 270),
                    clockwise: false)
        // Garis lurus ke pojok kanan atas
        path.addLine(to: CGPoint(x: rect.maxX - radius, y: rect.minY))
        // Kurva untuk sudut kanan atas
        path.addArc(center: CGPoint(x: rect.maxX - radius, y: rect.minY + radius),
                    radius: radius,
                    startAngle: Angle(degrees: 270),
                    endAngle: Angle(degrees: 0),
                    clockwise: false)
        // Garis lurus ke pojok kanan bawah
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        // Garis kembali ke pojok kiri bawah
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))

        return path
    }
}


struct BudgetProgressCard: View {
    let progressPercentage: Double = 0.7
    let colorAlert: Color
    var body: some View {
        ZStack(alignment: .topLeading){
            //logo and progress
            VStack{
                HStack{
                    Image(systemName: "checkmark.square.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height:45)
                        .foregroundStyle(.blue)
                    VStack(alignment: .leading){
                        Text("Basic Needs")
                            .font(.system(size: 18))
                            .fontWeight(.medium)
                            .foregroundStyle(.black)
                        Text("2 Transaction")
                            .fontWeight(.regular)
                            .foregroundStyle(.gray)
                            .font(.system(size: 14))
                            .truncationMode(.tail)
                            .lineLimit(1)
                    }
                    Spacer()
                    Text("Rp. 3.343.000")
                        .font(.system(size: 15))
                        .fontWeight(.medium)
                        .foregroundStyle(.black)
                }
                ZStack(alignment: .leading){
                    Capsule()
                        .frame(width: UIScreen.main.bounds.width-80)
                        .foregroundColor(Color(red: 226 / 255, green: 226 / 255, blue: 226 / 255, opacity: 1))
                    Capsule()
                        .frame(width: CGFloat(progressPercentage) * (UIScreen.main.bounds.width - 80))
                        .foregroundColor(Color(red: 31 / 255, green: 202 / 255, blue: 157 / 255, opacity: 1))
                }
                .frame(height: 6)
                .padding(.top, 8)
                HStack{
                    Text("Rp. 99.989.000 used")
                        .fontWeight(.regular)
                        .foregroundStyle(.gray)
                        .font(.system(size: 12))
                        .truncationMode(.tail)
                        .lineLimit(1)
                    Spacer()
                    Text("Rp. 99.989.000 remaining")
                        .fontWeight(.regular)
                        .foregroundStyle(.gray)
                        .font(.system(size: 12))
                        .truncationMode(.tail)
                        .lineLimit(1)
                }
                .padding(.top, 4)
            }
            .frame(height: 110)
            .padding(15)
            .padding(.top, 45)
            .background(Color("#F6F6F6"))
            .cornerRadius(10)
            
            //reminder
            VStack(){
                HStack{
                    Image("check")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20)
                    Text("Your budget is healty!")
                        .foregroundStyle(.white)
                        .font(.system(size: 15))
                }
            }
            .frame(maxWidth: 400, alignment: .leading)
            .padding(15)
            .background(colorAlert)
            .clipShape(TopCornersRoundedShape(radius: 10))
        }
        
    }
}

#Preview {
    BudgetProgressCard(colorAlert: Color(red: 31 / 255, green: 202 / 255, blue: 157 / 255, opacity: 1))
}
