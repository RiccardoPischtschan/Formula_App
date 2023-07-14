//
//  DriverRaw.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 13.07.23.
//

import SwiftUI

struct DriverRaw: View {
    var driver : DriverStandings
    var body: some View {
        VStack{
           
            ZStack{
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .foregroundStyle(.linearGradient(colors: [.black, .black], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width:350, height: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 5)
                            .foregroundStyle(.linearGradient(colors: [ Color("\(driver.Constructors[0].name ?? "") Color"), .black], startPoint: .topLeading, endPoint: .bottomTrailing))
                 
                    )
               
                HStack{
                    Text(driver.position ?? "")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 45)
                    Image(driverPic(for: (driver.Driver.code!) ) ?? "")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30)
                    VStack{
                        Text(driver.Driver.givenName! )
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Text(driver.Driver.familyName! )
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .offset(y: -1)
                    }
                    .frame(width: 100)
                        Parallelogramm()
                            .frame(width: 20, height: 30)
                            .foregroundColor(Color("\(driver.Constructors[0].name ?? "") Color"))
                    Text(driver.wins ?? "No Win")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 40)
                    Text(driver.points ?? "No Points")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 50)
                    
                    
                }
            }
            
        }
       
    }
}

struct DriverRaw_Previews: PreviewProvider {
    static var previews: some View {
        DriverRaw(driver: DriverStandings(position: "1", points: "255", wins: "8", Driver: DriverInfo(driverId: "VER", permanentNumber: "33", code: "VER", givenName: "Max", familyName: "Verstappen", dateOfBirth: "", nationality: ""), Constructors: [ConstructorList(constructorId: "Red Bull", name: "Red Bull", nationality: "")]))
    }
}
