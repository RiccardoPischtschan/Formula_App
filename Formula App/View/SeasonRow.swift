//
//  SeasonRow.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 26.06.23.
//

import SwiftUI

struct SeasonRow: View {
    var formula : Race
    var body: some View {
        VStack{
            HStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .foregroundStyle(.linearGradient(colors: [.red, .black], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width:40, height:40)
                        .rotationEffect(.degrees(135))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 3)
                                .foregroundStyle(.linearGradient(colors: [.black, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
                                .rotationEffect(.degrees(135))
                        )
                    
                    Text(formula.round)
                        .bold()
                        .font(.title)
                        .foregroundColor(.white)
                        .rotationEffect(.degrees(-45))
                }
                .padding(3)
                ZStack{
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .foregroundStyle(.linearGradient(colors: [.black, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width:230, height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 3)
                                .foregroundStyle(.linearGradient(colors: [.red, .black], startPoint: .topLeading, endPoint: .bottomTrailing))
                        )
                    VStack{
                        Text(formula.raceName)
                            .bold()
                            .foregroundColor(.white)
                            .offset(y:5)
                        HStack{
                            Image("\(formula.Circuit.Location.country) 1")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20,height: 20)
                                .offset(y: -5)
                            Text(reformatDate(_: formula.date))
                                .bold()
                                .foregroundColor(.white)
                                .offset(y:-5)
                        }
                    }
                }
            }
        }
    }
}
struct SeasonRow_Previews: PreviewProvider {
    static var previews: some View {
        SeasonRow(formula: Race(season: "", round: "3", raceName: "Emilia Romagna Grand Prix", Circuit: Circuit(circuitId: "", circuitName: "", Location: Location(lat: "", long: "", locality: "", country: "")), date: "2023-11-26", time: ""))
    }
}
