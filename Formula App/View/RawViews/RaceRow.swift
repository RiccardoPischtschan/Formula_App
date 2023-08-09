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
            ZStack{
                
                if race.position == "1" {
                    
                    Image("Gold")
                        .resizable()
                        .frame(width: 360, height: 60)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(15)
                    
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .foregroundStyle(.linearGradient(colors: [.clear, .black], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width:350, height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 3)
                                .frame(width:350, height: 50)
                                .foregroundStyle( Color(constructorColor(for: race.Driver.code ?? "") ?? ""))
                        )
                    
                } else if race.position == "2" {
                   
                        Image("Silber")
                            .resizable()
                            .frame(width: 360, height: 60)
                            .cornerRadius(15)
                    
                    .frame(width: 150, height: 10)
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .foregroundStyle(.linearGradient(colors: [.clear, .black], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width:350, height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 3)
                                .frame(width:350, height: 50)
                                .foregroundStyle( Color(constructorColor(for: race.Driver.code ?? "") ?? ""))
                        )
                    
                } else if race.position == "3" {
                    
                    Image("Bronze")
                        .resizable()
                        .frame(width: 360, height: 60)
                        .cornerRadius(15)
                    
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .foregroundStyle(.linearGradient(colors: [.clear, .black], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width:350, height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 3)
                                .frame(width:350, height: 50)
                                .foregroundStyle( Color(constructorColor(for: race.Driver.code ?? "") ?? ""))
                        )
                    
                } else {
                    
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .foregroundStyle(.linearGradient(colors: [.black, .black], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width:350, height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 3)
                                .frame(width:350, height: 50)
                                .foregroundStyle(.linearGradient(colors: [ Color(constructorColor(for: race.Driver.code ?? "") ?? ""), .white], startPoint: .topLeading, endPoint: .bottomTrailing))
                        )
                }
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
                    
                    if race.status == "Finished" {
                        Text(race.Time?.time ?? "DNF")
                            .foregroundColor(.white)
                            .frame(width: 120)
                    } else if race.status == "+1 Lap"{
                        Text("+1 Lap")
                            .foregroundColor(.white)
                            .frame(width: 120)
                    } else if race.status == "+2 Laps"{
                        Text("+2 Laps")
                            .foregroundColor(.white)
                            .frame(width: 120)
                    }
                    else if race.status == "Retired"{
                        Text("+3 Laps")
                            .foregroundColor(.white)
                            .frame(width: 120)
                    }
                    else {
                        Text("DNF")
                            .foregroundColor(.white)
                            .frame(width: 120)
                    }
                }
                .frame(width:350, height: 50)
                
                
                
            }
            .frame(height: 60)
        
        
    }
}

struct RaceRow_Previews: PreviewProvider {
    static var previews: some View {
        RaceRow(race: Result(number: "", position: "1", positionText: "", points: "", Driver: Driver(driverId: "", permanentNumber: "", code: "VER", givenName: "Max", familyName: "Verstappen", dateOfBirth: "", nationality: ""), Constructor: Constructor(constructorId: "", name: "", nationality: ""), grid: "", laps: "", status: "Finished", Time: Time(millis: "", time: "1:27:38.241"), FastestLap: FastestLap(rank: "", lap: "", Time: LapTime(time: ""), AverageSpeed: AverageSpeed(units: "", speed: ""))))
            .environmentObject(DataManager())
    }
}
