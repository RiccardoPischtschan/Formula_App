//
//  SeasonRow.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 26.06.23.
//

import SwiftUI

struct SeasonRow: View {
    
    var raceInfo : Formula
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
                    Text(raceInfo.locality)
                        .bold()
                }
            }
        }
    }
}

struct SeasonRow_Previews: PreviewProvider {
    static var previews: some View {
        SeasonRow(raceInfo: Formula(total: "", season: "", round: "1", raceName: "Bahrain", circuitId: "", circuitName: "", lat: "", long: "", locality: "", country: ""))
    }
}
