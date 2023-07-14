//
//  DriverView.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 12.07.23.
//

import SwiftUI

struct DriverView: View {
    @ObservedObject var driverViewModel = FormulaViewModel()
    var body: some View {
        NavigationStack{
            ZStack{
                Color.black.edgesIgnoringSafeArea(.all)
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .foregroundStyle(.linearGradient(colors: [.red, .black], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width:1000, height: 100)
                    .rotationEffect(.degrees(135))
                    .offset(y: -250)
                VStack{
                    Text("Driver Standings")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                    HStack{
                        Text("Pos")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .padding()
                            .padding()
                        Text("Name")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .padding()
                            
                        Text("Win´s")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .padding()
                            .padding()
                        Text("Points")
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                    .offset(x: -10)
                    VStack{
                        ScrollView{
                            ForEach(driverViewModel.driver, id: \.self){ driver in
                                DriverRaw(driver: driver)
                            }
                        }
                    }
                    .onAppear{
                        driverViewModel.fetchFormulaApiResponse("current/driverStandings","driver")
                    }
                    VStack{
                        Spacer()
                    }
                }
            }
        }
    }
}

struct DriverView_Previews: PreviewProvider {
    static var previews: some View {
        DriverView()
    }
}
