//
//  BarChart.swift
//  ManageDose
//
//  Created by MacBook Pro on 24/05/24.
//

import SwiftUI
import Charts

struct RevenueStream: Identifiable{
    let id = UUID()
    let name: String
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
        VStack{
            ZStack{
                Chart{
                    ForEach(MockData.revenueStream){ stream in
                        SectorMark(angle: .value("Stream", stream.value),
                                   innerRadius: .ratio(0.618),
                                   angularInset: 1.0)
                            .foregroundStyle(stream.color)
                            .annotation(position: .overlay){
                                Text("\(stream.value)%")
                                    .bold()
                                    .foregroundStyle(.white)
                            }
                    }
                }
                .frame(width: 300, height: 300)
                
                VStack{
                    Text("Budgeting Precentage")
                        .font(.system(size: 12))
                        .fontWeight(.semibold)
                        .foregroundStyle(.gray)
                    Text("Rp \(self.budget)")
                        .font(.system(size: 15))
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
                            .font(.system(size: 12))
                    }
                }
            }
            .padding(5)
        }
        .padding()
    }
}


#Preview {
    PieChart(basic: 50, savings: 20, wants: 30, budget: 1000000)
}

