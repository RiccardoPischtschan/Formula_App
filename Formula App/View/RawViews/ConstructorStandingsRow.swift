//
//  ConstructorStandingsRow.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 14.07.23.
//

import SwiftUI

struct ConstructorStandingsRow: View {
    var constructor : ConstructorStandings
    var body: some View {
        VStack{
            
            ZStack{
                
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .foregroundStyle(.linearGradient(colors: [.white, .clear], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width:350, height: 130)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 5)
                            .foregroundStyle(.linearGradient(colors: [ Color("\(constructor.Constructor.name ?? "") Color"), .clear], startPoint: .leading, endPoint: .trailing))
                             )
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .foregroundStyle(.linearGradient(colors: [.clear, .white], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width:350, height: 130)
                    .offset(y: 60)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 5)
                            .offset(y: 60)
                            .foregroundStyle(.linearGradient(colors: [.clear, .black], startPoint: .leading, endPoint: .trailing))
                             )
                RoundedRectangle(cornerRadius: 10, style: .circular)
                    .foregroundStyle(.linearGradient(colors: [.white, Color("\(constructor.Constructor.name ?? "") Color")], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width:350, height: 100)
                    .offset(y:30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 5)
                            .offset(y:30)
                            .foregroundStyle(.linearGradient(colors: [ Color("\(constructor.Constructor.name ?? "") Color"), .black], startPoint: .topLeading, endPoint: .bottomTrailing))
                             )
                VStack{
                    HStack{
                        Text(constructor.position ?? "")
                            .foregroundColor(.black)
                            .font(.title)
                            .bold()
                            .frame(width: 40)
                            .offset(x: -40, y: 40)
                        
                        Text(constructor.Constructor.name!)
                            .foregroundColor(.black)
                            .font(.title)
                            .bold()
                            .frame(width: 200)
                            .offset(y: 40)
                    }
                    Image("\(constructor.Constructor.name ?? "") Car")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 320)
                        .offset( y:30)
                    HStack{
                        Image("\(constructor.Constructor.name ?? "") Logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40)
                            .offset(x: -80, y:25)
                            
                        ZStack{
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 70,height: 30)
                            Text("PTS")
                                .foregroundColor(.white)
                                .bold()
                                .font(.title)
                        }
                        .offset( y: 25)
                        
                        Text(constructor.points ?? "")
                            .foregroundColor(.black)
                            .font(.title)
                            .bold()
                            .offset(x: 60, y:25)
                    }
                }
            }
        }
    }
}

struct ConstructorStandingsRow_Previews: PreviewProvider {
    static var previews: some View {
        ConstructorStandingsRow(constructor: ConstructorStandings(position: "1", points: "411", wins: "10", Constructor: ConstructorStandingList(constructorId: "red_bull", name: "Red Bull", nationality: "Austrian")))
    }
}
