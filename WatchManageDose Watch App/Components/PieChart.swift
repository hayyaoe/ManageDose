//
//  PieChart.swift
//  WatchManageDose Watch App
//
//  Created by MacBook Pro on 06/06/24.
//

import SwiftUI
import Charts

struct RevenueStream: Identifiable{
    let id = UUID()
    var name: String
    let value: Int
    let color: Color
}

struct MockData {
    static var revenueStream: [RevenueStream] = []
    
    init(revenueStream: [RevenueStream]) {
        MockData.revenueStream = revenueStream
    }
}

struct PieChart: View {
    let basic: Double
    let savings: Double
    let wants: Double
    let budget: Double
    
    init(basic: Double, savings: Double, wants: Double, budget: Double) {
        self.basic = basic
        self.savings = savings
        self.wants = wants
        self.budget = budget
        let revenueStream: [RevenueStream] = [
            .init(name: "Basic Needs", value: Int(basic.rounded()), color: Color(red: 254 / 255.0, green: 172 / 255.0, blue: 40 / 255.0)),
            .init(name: "Wants", value: Int(wants.rounded()), color: Color(red: 230/255, green: 99/255, blue: 99/255)),
            .init(name: "Saving", value: Int(savings.rounded()), color: Color(red: 99 / 255.0, green: 97 / 255.0, blue: 148 / 255.0))
        ]
        MockData(revenueStream: revenueStream)
    }
    
    var body: some View {
        ZStack{
        
        VStack{
            ZStack{
                Chart{
                    ForEach(MockData.revenueStream){ stream in
                        SectorMark(angle: .value("Stream", stream.value),
                                   innerRadius: .ratio(0.6),
                                   angularInset: 1.0)
                            .foregroundStyle(stream.color)
                            .annotation(position: .overlay){
                                Text("\(stream.value)%")
                                    .font(.system(size: 14))
                                    .bold()
                                    .foregroundStyle(.white)
                                    .offset(x: {
                                        if (stream.name == "Basic Needs"){
                                            return -4
                                        } else {
                                            return 6
                                        }
                                    }())
                            }
                    }
                }
                .frame(width: 160, height: 160)
                
                VStack{
                    Text("Percentage")
                        .font(.system(size: 10))
                        .fontWeight(.semibold)
                        .foregroundStyle(.gray)
                    Text("Rp \(self.budget, format: .number)")
                        .font(.system(size: 13))
                        .fontWeight(.medium)
                        .foregroundStyle(.black)
                }
            }
            HStack(){
                ForEach(MockData.revenueStream){ stream in
                    HStack {
                        Circle()
                            .foregroundColor(stream.color)
                            .frame(width: 8, height: 8)
                        Text(stream.name)
                            .font(.system(size: 10))
                            .foregroundStyle(.gray)
                        
                    }
                }
            }
            .padding(5)
        }
        .padding()
        }
    }
}


#Preview {
    PieChart(basic: 50, savings: 20, wants: 30, budget: 1000000)
}
