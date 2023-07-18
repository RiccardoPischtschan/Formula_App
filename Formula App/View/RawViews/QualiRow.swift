//
//  QualiRow.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 11.07.23.
//

import SwiftUI

struct QualiRow: View {
    var quali: QualiResults
   
   
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
                    
                    Text(quali.position ?? "")
                        .bold()
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(width: 45)
                    if driverPic(for: quali.Driver.code ?? "") != nil{
                        Image(driverPic(for: quali.Driver.code ?? "") ?? "")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30)
                        
                    } else {
                        Text(quali.Driver.code ?? "")
                            .foregroundColor(.white)
                        
                    }
                    
                    VStack{
                        Text(quali.Driver.givenName!)
                            .foregroundColor(.white)
                        
                        Text(quali.Driver.familyName!)
                            .foregroundColor(.white)
                            .offset(y: -3)
                    }
                    .frame(width: 120)
                    
                   
                        if quali.Q3 != nil {
                            Text(quali.Q3 ?? "DNF")
                                    .foregroundColor(.white)
                                    .frame(width: 120)
                           
                        } else if quali.Q2 != nil {
                            Text(quali.Q2 ?? "DNF")
                                .foregroundColor(.white)
                                .frame(width: 120)
                        } else if quali.Q1 != nil {
                            Text(quali.Q1 ?? "DNF")
                                .foregroundColor(.white)
                                .frame(width: 120)
                        }
                    
                    
                    }
                }
            }
            
            
        }
    }


struct QualiRow_Previews: PreviewProvider {
    static var previews: some View {
        QualiRow(quali: QualiResults(number: "", position: "1", Driver: DriverQuali(driverId: "", code: "VER", givenName: "Max", familyName: "Verstappen", dateOfBirth: "", nationality: ""), Constructor: ConstructorQuali(constructorId: "", name: "", nationality: ""), Q1: "1:24.634", Q2: "1:24.634", Q3: "1:24.634"))
    }
}
