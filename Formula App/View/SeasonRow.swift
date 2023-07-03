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

                   
                    
                   
                        ZStack {
                            Rectangle()
                                .cornerRadius(20)
                                .frame(width: 300, height: 50)
                                .foregroundColor(Color(hue: 1.0, saturation: 0.878, brightness: 0.988, opacity: 0.949))
                            
                            ZStack {
                                Ellipse()
                                    .frame(width: 280)
                                    .foregroundColor(.white)
                                
                                HStack(spacing: 10) {
                                    Text(formula.round)
                                        .font(.title)
                                        .bold()
                                        .frame(width: 40)
                                        .font(.system(size: 28))
                                    
                                    VStack(alignment: .leading) {
                                        
                                        Text(formula.raceName)
                                            .bold()
                                            .frame(width: 220)
                                        
                                        
                                        Text(reformatDate(_: formula.date))
                                            .bold()
                                            .frame(width: 220)
                                    }
                                    
                                }
                            }
                            .padding()
                        }

                }
            }
        }
   


struct SeasonRow_Previews: PreviewProvider {
    static var previews: some View {
        SeasonRow(formula: Race(season: "", round: "3", raceName: "Emilia Romagna Grand Prix", Circuit: Circuit(circuitId: "", circuitName: "", Location: Location(lat: "", long: "", locality: "", country: "")), date: "", time: ""))
    }
}
