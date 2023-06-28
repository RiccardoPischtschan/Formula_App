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
        ZStack{
            Rectangle()
                .cornerRadius(20)
                .frame(width: 300,height: 50)
                .foregroundColor(.gray)
            HStack(spacing: 40){
                Text(formula.round)
                    .font(.title)
                    .bold()
                
                VStack{
                    Text(formula.raceName)
                        .bold()
                    Text(formula.date)
                        .bold()
                }
            }
        }
    }
}

struct SeasonRow_Previews: PreviewProvider {
    static var previews: some View {
        SeasonRow(formula: Race(season: "", round: "", raceName: "", Circuit: Circuit(circuitId: "", circuitName: "", Location: Location(lat: "", long: "", locality: "", country: "")), date: "", time: ""))
    }
}
