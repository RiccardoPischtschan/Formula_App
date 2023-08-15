//
//  CircuitDetails.swift
//  FormulaTestApp
//
//  Created by Riccardo Pischtschan on 01.07.23.
//

import SwiftUI

struct CircuitDetails: View {
    var circuitViewModel : FormulaViewModel
    @EnvironmentObject var firebaseAuth: FirebaseAuthService
    @EnvironmentObject  var dataManager : DataManager
    @Binding var circuitID: String
    @Binding var selectedYear: String
    @Binding var selectedCountry: String
    @Binding var selectedRound: String
    @Binding var selectedDate: String
    @State private var selectedTheme = "Race Result"
    var theme = ["Race Result", "Qualifying Result"]
    @State private var DriverId: String?
    @State private var DriverIdBinding: Binding<String>?
    @State private var DriverCode: String?
    @State private var DriverCodeBinding: Binding<String>?
    @State private var DriverIds: String?
    @State private var DriverIdsBinding: Binding<String>?
    @State private var DriverCodes: String?
    @State private var DriverCodesBinding: Binding<String>?
    @State var isShow = false
    @State var isShow2 = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                if dataManager.currentUser.color == "Light"{
                    Color.white.edgesIgnoringSafeArea(.all)
                    
                } else {
                    Color.black.edgesIgnoringSafeArea(.all)
                    
                }
                VStack{
                    VStack{
                        Picker("",selection: $selectedTheme){
                            ForEach(theme, id:\.self){
                                Text($0)
                                    .font(.title)
                                    

                                    

                            }
                            
                        }
                        .font(.largeTitle)
                        .pickerStyle(.segmented)
                    }
                    ScrollView{
                        VStack{
                            
                            HStack{
                                Image("\(selectedCountry) 1")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40,height: 40)
                                    .padding()
                                
                                if dataManager.currentUser.color != "Light" {
                                    Text(selectedCountry.uppercased())
                                        .font(.custom("RussoOne-Regular", size: 32))

                                        .foregroundColor(.white)
                                } else {
                                    Text(selectedCountry.uppercased())
                                        .font(.custom("RussoOne-Regular", size: 32))

                                        .foregroundColor(.black)
                                }
                            }
                            .offset(y:30)
                            ZStack{
                                
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 350, height: 250)
                                    .foregroundColor(.gray)
                                
                                Image(circuitID)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(20)
                                    .frame(width: 350,height: 250)
                                    .overlay{
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(lineWidth: 3)
                                            .foregroundColor(Color("\(appColorStyle(for: dataManager.currentUser.color) ?? "Red Bull Color")"))
                                        
                                    }
                            }
                            if dataManager.currentUser.color != "Light"{
                                Text("Route Length: \(routeLength(for: circuitID) ?? "Not found")")
                                    .font(.custom("RussoOne-Regular", size: 16))

                                    .foregroundColor(.white)
                                Text("Track Record: \(trackRecord(for: circuitID) ?? "Not found")")
                                    .font(.custom("RussoOne-Regular", size: 16))

                                    .foregroundColor(.white)
                            } else {
                                Text("Route Length: \(routeLength(for: circuitID) ?? "Not found")")
                                    .font(.custom("RussoOne-Regular", size: 16))

                                    .foregroundColor(.black)
                                Text("Track Record: \(trackRecord(for: circuitID) ?? "Not found")")
                                    .font(.custom("RussoOne-Regular", size: 16))

                                    .foregroundColor(.black)
                            }
                            
                            Divider()
                                .frame(width: 350, height: 3)
                                .overlay(Color("\(appColorStyle(for: dataManager.currentUser.color) ?? "Red Bull Color")"))
                            

                            
                            if selectedTheme == "Race Result" {
                                VStack{
                                    if istDatumVergangen(datumString: selectedDate){
                                        ForEach(circuitViewModel.results, id: \.self){ result in
                                            let driverId = result.Driver.driverId
                                            
                                            let driverCode = result.Driver.code
                                            NavigationStack{
                                                
                                                RaceRow(race: result)
                                            }
                                            .navigationDestination(isPresented: $isShow){
                                                DriverDetails(selectedDriverId: DriverIdBinding ??  .constant(driverId ?? ""), selectedDriverCode: DriverCodeBinding ??  .constant(driverCode ?? ""))
                                            }
                                            .onTapGesture {
                                                DriverId = driverId
                                                DriverIdBinding = Binding<String>(get: { driverId! }, set: { _ in })
                                                DriverCode = driverCode
                                                DriverCodeBinding = Binding<String>(get: { driverCode ?? "" }, set: { _ in })
                                                isShow = true
                                            }
                                        }
                                    } else {
                                        
                                        if dataManager.currentUser.color != "Light" {
                                            Text("\(berechneTageBisRennen(rennenDatumString: selectedDate))")
                                                .font(.custom("RussoOne-Regular", size: 26))
                                                .foregroundColor(.white)
                                        } else {
                                            Text("\(berechneTageBisRennen(rennenDatumString: selectedDate))")
                                                .font(.custom("RussoOne-Regular", size: 26))
                                                .foregroundColor(.black)
                                        }
                                    }
                                }
                                
                            } else if selectedTheme == "Qualifying Result" {
                                VStack{
                                    if istDatumVergangen(datumString: selectedDate){
                                        
                                        ForEach(circuitViewModel.quali, id: \.self){ result in
                                            let driverIds = result.Driver.driverId
                                            
                                            let driverCodes = result.Driver.code
                                            NavigationStack{
                                            QualiRow(quali: result)
                                            }
                                            .navigationDestination(isPresented: $isShow2){
                                                DriverDetails(selectedDriverId: DriverIdsBinding ?? .constant(driverIds ?? ""), selectedDriverCode: DriverCodesBinding ?? .constant(driverCodes ?? ""))
                                            }
                                            .onTapGesture {
                                                DriverIds = driverIds
                                                DriverIdsBinding = Binding<String>(get: { driverIds! }, set: { _ in })
                                                DriverCodes = driverCodes
                                                DriverCodesBinding = Binding<String>(get: { driverCodes! }, set: { _ in })
                                                isShow2 = true
                                            }
                                        }
                                    } else {
                                        if dataManager.currentUser.color != "Light" {
                                            Text("\(berechneTageBisRennen(rennenDatumString: selectedDate))")
                                                .font(.custom("RussoOne-Regular", size: 26))
                                                .foregroundColor(.white)
                                        } else {
                                            Text("\(berechneTageBisRennen(rennenDatumString: selectedDate))")
                                                .font(.custom("RussoOne-Regular", size: 26))

                                                .foregroundColor(.black)
                                        }
                                    }
                                    
                                    
                                }
                              
                            }
                        }
                        .frame(width: 360)
                        .onAppear{
                            circuitViewModel.fetchFormulaApiResponse("\(selectedYear)/\(selectedRound)","qualifying")
                        }
                        .offset(y: -25)
                        
                        
                        
                        
                    }
//                    .position(x: 200,y: 300)
                }
                .frame(height: 680)
              
                VStack{
                   Spacer()
                }
            }
            
        }
        .onAppear{
            circuitViewModel.fetchFormulaApiResponse("\(selectedYear)/\(selectedRound)","results")
        }
    }
}

struct CircuitDetails_Previews: PreviewProvider {
    static var previews: some View {
        CircuitDetails(circuitViewModel: FormulaViewModel(), circuitID: .constant("bahrain"),selectedYear: .constant("2023"),selectedCountry: .constant("Bahrain"), selectedRound: .constant(""), selectedDate: .constant(""))
            .environmentObject(DataManager())
    }
}
