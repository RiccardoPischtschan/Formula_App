//
//  RaceRow.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 10.07.23.
//

import SwiftUI

struct RaceRow: View {
    var race : Result
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .foregroundStyle(.linearGradient(colors: [.red, .black], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width:350, height: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 3)
                            .foregroundStyle(.linearGradient(colors: [.black, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
                    )
                
                    HStack{

                        Text(race.position ?? "")
                            .bold()
                            .font(.largeTitle)
                           .foregroundColor(.white)
                           .frame(width: 45)
                        if driverPic(for: race.Driver.code ?? "") != nil{
                            Image(driverPic(for: race.Driver.code ?? "") ?? "")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30)
                                
                        } else {
                            Text(race.Driver.code ?? "")
                                .foregroundColor(.white)
                                
                        }
                            
                        VStack{
                            Text(race.Driver.givenName ?? "")
                                .foregroundColor(.white)
                                
                            Text(race.Driver.familyName ?? "")
                                .foregroundColor(.white)
                                .offset(y: -3)
                        }
                        .frame(width: 120)
                        
                        Text(race.Time?.time ?? "DNF")
                            .foregroundColor(.white)
                            .frame(width: 120)
                        
                    }
                
            }
            
            
        }
    }
}

struct RaceRow_Previews: PreviewProvider {
    static var previews: some View {
        RaceRow(race: Result(number: "", position: "1", positionText: "", points: "", Driver: Driver(driverId: "", permanentNumber: "", code: "VER", givenName: "Max", familyName: "Verstappen", dateOfBirth: "", nationality: ""), Constructor: Constructor(constructorId: "", name: "", nationality: ""), grid: "", laps: "", status: "", Time: Time(millis: "", time: "1:27:38.241"), FastestLap: FastestLap(rank: "", lap: "", Time: LapTime(time: ""), AverageSpeed: AverageSpeed(units: "", speed: ""))))
    }
}
