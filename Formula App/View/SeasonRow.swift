//
//  SeasonRow.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 26.06.23.
//

import SwiftUI

struct SeasonRow: View {
    
    var raceInfo = Race(season: "2022", round: "1", raceName: "Bahrain Grand Prix", Circuit: Circuit(circuitId: "", circuitName: "", Location: Location(lat: "", long: "", locality: "Sakhir", country: "")))
    var body: some View {
        ZStack{
            Rectangle()
                .cornerRadius(20)
                .frame(width: 300,height: 50)
                .foregroundColor(.gray)
            HStack(spacing: 40){
                Text(raceInfo.round)
                    .font(.title)
                    .bold()
                
                VStack{
                    Text(raceInfo.raceName)
                        .font(.title3)
                        .bold()
                    Text(raceInfo.Circuit.Location.locality)
                        .bold()
                }
            }
        }
    }
}

struct SeasonRow_Previews: PreviewProvider {
    static var previews: some View {
        SeasonRow()
    }
}
