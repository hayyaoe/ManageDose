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

struct MockData{
    static var revenueStream: [RevenueStream] = [
        .init(name: "Basic Needs", value: 50, color: Color(red: 254 / 255.0, green: 172 / 255.0, blue: 40 / 255.0)),
        .init(name: "Wants", value: 30, color: Color(red: 230/255, green: 99/255, blue: 99/255)),
        .init(name: "Saving", value: 10, color: Color(red: 99 / 255.0, green: 97 / 255.0, blue: 148 / 255.0))
    ]
}

struct PieChart: View {
    
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
                    Text("Rp. 12.122.999")
                        .font(.system(size: 15))
                        .fontWeight(.medium)
                        .foregroundStyle(.black)
                }
            }
            HStack(){
                HStack {
                    Circle()
                        .foregroundColor(Color(red: 254 / 255.0, green: 172 / 255.0, blue: 40 / 255.0))
                        .frame(width: 8, height: 8)
                    Text("Basic Needs")
                        .font(.system(size: 12))
                }
                HStack {
                    Circle()
                        .foregroundColor(Color(red: 230/255, green: 99/255, blue: 99/255))
                        .frame(width: 8, height: 8)
                    Text("Wants")
                        .font(.system(size: 12))
                }
                HStack {
                    Circle()
                        .foregroundColor(Color(red: 99 / 255.0, green: 97 / 255.0, blue: 148 / 255.0))
                        .frame(width: 8, height: 8)
                    Text("Saving")
                        .font(.system(size: 12))
                }
            }
            .padding(5)
        }
        .padding()
    }
}


#Preview {
    PieChart()
}

