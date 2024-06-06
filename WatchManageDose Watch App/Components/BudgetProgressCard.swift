//
//  BudgetProgressCard.swift
//  WatchManageDose Watch App
//
//  Created by MacBook Pro on 06/06/24.
//

import SwiftUI
import SwiftData

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
    let budget: Double
    let used: Double
    let name: String
    
    @Query(sort: \ExpenseData.date) private var expenses: [ExpenseData]

    var categoryBudget: Budget {
        switch name {
        case "Basic Needs":
            return .dailyneeds
        case "Wants":
            return .wants
        case "Savings":
            return .saving
        default:
            return .dailyneeds
        }
    }
    
    var numberOfTransactions: Int {
        return expenses.filter { $0.budget.rawValue == categoryBudget.rawValue }.count
    }
    
    var icon: String {
        switch name {
        case "Basic Needs":
            return "basic needs"
        case "Wants":
            return "wants"
        case "Savings":
            return "savings"
        default:
            return "basic needs"
        }
    }
    
        
    var body: some View {
        let remaining = budget - used
        let progressPercentage = used / budget
        ZStack(alignment: .topLeading){
            //logo and progress
            VStack{
                HStack{
                    Image(icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height:24)
                        .foregroundStyle(.blue)
                    VStack(alignment: .leading){ // Align content to the leading edge
                        Text("\(self.name)")
                            .font(.system(size: 12))
                            .fontWeight(.medium)
                            .foregroundStyle(.black)
                    }
                    Spacer()
                    Text("Rp \(self.budget, format: .number)")
                        .font(.system(size: 12))
                        .fontWeight(.medium)
                        .foregroundStyle(.black)
                        .multilineTextAlignment(.trailing)
                }
                ZStack(alignment: .leading){
                    Capsule()
                        .frame(width: WKInterfaceDevice.current().screenBounds.width - 20)
                        .foregroundColor(Color(red: 226 / 255, green: 226 / 255, blue: 226 / 255, opacity: 1))
                    Capsule()
                        .frame(width: {
                            if progressPercentage <= 1.0{
                                return CGFloat(progressPercentage) * (WKInterfaceDevice.current().screenBounds.width - 20)
                            } else {
                                return CGFloat (WKInterfaceDevice.current().screenBounds.width - 20)
                            }
                        }())
                    
                        .foregroundColor({
                            if progressPercentage < 0.5 {
                                return Color(red: 31 / 255, green: 202 / 255, blue: 157 / 255, opacity: 1)
                            } else if progressPercentage < 0.8 {
                                return Color.yellow
                            } else {
                                return Color.red
                            }
                        }())

                }
                .frame(height: 6)
                .padding(.top, 8)
                HStack{
                    Text("\(self.used, format: .number) used")
                        .fontWeight(.regular)
                        .foregroundStyle(.gray)
                        .font(.system(size: 10))
                        .truncationMode(.tail)
                        .lineLimit(1)
                    Spacer()
                    Text("\(remaining, format: .number) left")
                        .fontWeight(.regular)
                        .foregroundStyle(.gray)
                        .font(.system(size: 10))
                        .truncationMode(.tail)
                        .lineLimit(1)
                }
                .padding(.top, 4)
            }
            .padding(10)
            .padding(.top, 36)
            .background(Color(red: 246 / 255, green: 246 / 255, blue: 246 / 255))
            .cornerRadius(10)
            
            //reminder
            VStack(alignment: .leading){ // Align content to the leading edge
                HStack{
                    Image("check")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 16)
                    if progressPercentage < 0.5 {
                        Text("Your budget is healthy!")
                            .foregroundStyle(.white)
                            .font(.system(size: 11))
                    } else if progressPercentage < 0.8 {
                        Text("Watch your spending!")
                            .foregroundStyle(.white)
                            .font(.system(size: 11))
                    } else if progressPercentage < 1.0 {
                        Text("Your budget is almost full!")
                            .foregroundStyle(.white)
                            .font(.system(size: 11))
                    } else {
                        Text("You have exceeded your budget!")
                            .foregroundStyle(.white)
                            .font(.system(size: 11))
                    }
                    
                }
            }
            .frame(maxWidth: 400, alignment: .leading)
            .padding(10)
            .background({
                if progressPercentage <= 0.0 {
                    return Color(hex: "5339EE")
                } else if progressPercentage < 0.5 {
                    return Color(red: 31 / 255, green: 202 / 255, blue: 157 / 255, opacity: 1)
                } else if progressPercentage < 0.8 {
                    return Color.yellow
                } else {
                    return Color.red
                }
            }())
            .clipShape(TopCornersRoundedShape(radius: 10))
        }
    }
}

#Preview {
    BudgetProgressCard(budget: 2000000, used: 0, name: "Savings")
}
