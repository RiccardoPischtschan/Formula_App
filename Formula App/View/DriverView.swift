//
//  DriverView.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 12.07.23.
//

import SwiftUI

struct DriverView: View {
    @ObservedObject var driverViewModel = FormulaViewModel()
    @EnvironmentObject  var dataManager : DataManager
    @State private var selectedDriverId: String?
    @State private var selectedDriverIdBinding: Binding<String>?
    @State private var selectedDriverCode: String?
    @State private var selectedDriverCodeBinding: Binding<String>?
    var body: some View {
        
                if dataManager.currentUser.color == "Light"{
                   
                    NavigationStack{
                        ZStack{
                            Color.white.edgesIgnoringSafeArea(.all)
                            RoundedRectangle(cornerRadius: 30, style: .continuous)
                                .foregroundStyle(.linearGradient(colors: [.red, Color("\(appColorStyle(for: dataManager.currentUser.color) ?? "Red Bull Color")")], startPoint: .topLeading, endPoint: .bottomTrailing))
                                .frame(width:1000, height: 130)
                                .rotationEffect(.degrees(180))
                                .offset(y: -300)
                            RoundedRectangle(cornerRadius: 30, style: .continuous)
                                .foregroundStyle(.linearGradient(colors: [Color("\(appColorStyle(for: dataManager.currentUser.color) ?? "Red Bull Color")"), .black], startPoint: .topLeading, endPoint: .bottomTrailing))
                                .frame(width:1000, height: 120)
                                .rotationEffect(.degrees(180))
                                .offset(y: -300)
                          
                            VStack{
                                Text("Driver Standings")
                                    .font(.largeTitle)
                                    .bold()
                                    .foregroundColor(.white)
                                    .offset(y: 40)
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
                                .offset(x: -10, y: 10)
                                VStack{
                                    ScrollView{
                                        ForEach(driverViewModel.driver, id: \.self){ driver in
                                            let driverId = driver.Driver.driverId
                                            let driverCode = driver.Driver.code
                                        
                                            NavigationLink(
                                                destination:
                                                    DriverDetails(selectedDriverId: selectedDriverIdBinding ?? .constant(driverId!), selectedDriverCode: selectedDriverCodeBinding ?? .constant(driverCode!)),
                                                label: {
                                                    DriverRaw(driver: driver)
                                                    
                                                })
                                            .onTapGesture {
                                                selectedDriverId = driverId
                                                selectedDriverIdBinding = Binding<String>(get: { driverId! }, set: { _ in })
                                                selectedDriverCode = driverCode
                                                selectedDriverCodeBinding = Binding<String>(get: { driverCode! }, set: { _ in })
                                            }
                                        }
                                        .frame(width: 380)
                                        .offset(y: 8)
                                    }
                                }
                                .frame(height: 595)
                                .offset(y: -11)
                                .onAppear{
                                    driverViewModel.fetchFormulaApiResponse("current/driverStandings","driver")
                                }
                                VStack{
                                    Divider()
                                        .frame(height: 5)
                                        .overlay(.linearGradient(colors: [.red, Color("\(appColorStyle(for: dataManager.currentUser.color) ?? "Red Bull Color")")], startPoint: .topLeading, endPoint: .bottomTrailing))
                                        .offset(y: -23)
                                }
                            }
                        }
                    }
                    
                    
                } else {
                   
                    NavigationStack{
                        ZStack{
                            Color.black.edgesIgnoringSafeArea(.all)
                            RoundedRectangle(cornerRadius: 30, style: .continuous)
                                .foregroundStyle(.linearGradient(colors: [Color("\(appColorStyle(for: dataManager.currentUser.color) ?? "Red Bull Color")"), .black], startPoint: .topLeading, endPoint: .bottomTrailing))
                                .frame(width:1000, height: 100)
                                .rotationEffect(.degrees(135))
                                .offset(y: -250)
                            VStack{
                                Text("Driver Standings")
                                    .font(.largeTitle)
                                    .bold()
                                    .foregroundColor(.white)
                                    .offset(y: 40)
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
                                .offset(x: -10, y: 10)
                                VStack{
                                    ScrollView{
                                        ForEach(driverViewModel.driver, id: \.self){ driver in
                                            let driverId = driver.Driver.driverId
                                            let driverCode = driver.Driver.code
                                        
                                            NavigationLink(
                                                destination:
                                                    DriverDetails(selectedDriverId: selectedDriverIdBinding ?? .constant(driverId!), selectedDriverCode: selectedDriverCodeBinding ?? .constant(driverCode!)),
                                                label: {
                                                    DriverRaw(driver: driver)
                                                    
                                                })
                                            .onTapGesture {
                                                selectedDriverId = driverId
                                                selectedDriverIdBinding = Binding<String>(get: { driverId! }, set: { _ in })
                                                selectedDriverCode = driverCode
                                                selectedDriverCodeBinding = Binding<String>(get: { driverCode! }, set: { _ in })
                                            }
                                        }
                                        .frame(width: 360)
                                        .offset(y:3)
                                    }
                                }
                                .frame(height: 595)
                                .offset(y: -11)
                                .onAppear{
                                    driverViewModel.fetchFormulaApiResponse("current/driverStandings","driver")
                                }
                                VStack{
                                    Divider()
                                        .frame(height: 5)
                                        .overlay( Color("\(appColorStyle(for: dataManager.currentUser.color) ?? "Red Bull Color")"))
                                        .offset(y: -23)
                                }
                            }
                        }
                    }
                }
 
    }
}

struct DriverView_Previews: PreviewProvider {
    static var previews: some View {
        DriverView()
            .environmentObject(DataManager())
    }
}
