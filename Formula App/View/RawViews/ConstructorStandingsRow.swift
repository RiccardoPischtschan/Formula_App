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
                            .font(.custom("RussoOne-Regular", size: 32))
                            .frame(width: 40)
                            .offset(x: -10, y: 42)
                        
                        Text(constructor.Constructor.name!)
                            .foregroundColor(.black)
                            .font(.custom("RussoOne-Regular", size: 32))
                            .frame(width: 250)
                            .offset(y: 42)
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
                            .offset(x: -80, y:22)
                            
                        ZStack{
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(.black)
                                .frame(width: 70,height: 30)
                                .offset(y: -5)
                            Text("PTS")
                                .foregroundColor(.white)
                                .font(.custom("RussoOne-Regular", size: 26))
                                .offset(y: -5)

                        }
                        .offset( y: 25)
                        
                        Text(constructor.points ?? "")
                            .foregroundColor(.black)
                            .font(.custom("RussoOne-Regular", size: 32))

                            .offset(x: 60, y:22)
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
