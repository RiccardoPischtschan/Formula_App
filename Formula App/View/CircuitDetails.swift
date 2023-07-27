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
    let theme = ["Race Result", "Qualifying Result"]
    
   
    
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
                        Spacer()
                    }
                    ScrollView{
                        VStack{
                            
                            HStack{
                                Image("\(selectedCountry) 1")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40,height: 40)
                                    .padding()
                                Text(selectedCountry.uppercased())
                                    .font(.largeTitle)
                                    .bold()
                                    .foregroundColor(.white)
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
                            Text("Route Length: \(routeLength(for: circuitID) ?? "Not found")")
                                .bold()
                                .foregroundColor(.white)
                            Text("Track Record: \(trackRecord(for: circuitID) ?? "Not found")")
                                .bold()
                                .foregroundColor(.white)
                            
                            Divider()
                                .frame(width: 350, height: 3)
                                .overlay(Color("\(appColorStyle(for: dataManager.currentUser.color) ?? "Red Bull Color")"))
                            
                            //                    Text("Race Results \(selectedYear)")
                            //                        .bold()
                            //                        .font(.title2)
                            //                        .foregroundColor(.white)
                            Picker("",selection: $selectedTheme){
                                ForEach(theme,id:\.self){
                                    Text($0)
                                }
                            }
                            .pickerStyle(.segmented)
                            
                            if selectedTheme == "Race Result" {
                                VStack{
                                    if istDatumVergangen(datumString: selectedDate){
                                        ForEach(circuitViewModel.results, id: \.self){ result in
                                            RaceRow(race: result)
                                            
                                        }
                                    } else {
                                        
                                        Text("\(berechneTageBisRennen(rennenDatumString: selectedDate))")
                                            .foregroundColor(.white)
                                    }
                                }
                                .onAppear{
                                    circuitViewModel.fetchFormulaApiResponse("\(selectedYear)/\(selectedRound)","results")
                                }
                            } else{
                                VStack{
                                    if istDatumVergangen(datumString: selectedDate){
                                        
                                        ForEach(circuitViewModel.quali, id: \.self){ result in
                                            QualiRow(quali: result)
                                        }
                                    } else {
                                        
                                        Text("\(berechneTageBisRennen(rennenDatumString: selectedDate))")
                                            .foregroundColor(.white)
                                    }
                                    
                                    
                                }
                                //                        .onAppear{
                                //                            circuitViewModel.fetchFormulaApiResponse("\(selectedYear)/\(selectedRound)","qualifying")
                                //                        }
                            }
                        }
                        .frame(width: 360)
                        .onAppear{
                            circuitViewModel.fetchFormulaApiResponse("\(selectedYear)/\(selectedRound)","qualifying")
                        }
                        
                        
                        
                        
                    }
//                    .position(x: 200,y: 300)
                }
                .frame(height: 680)
              
                VStack{
                   Spacer()
                }
            }
            
        }
    }
}

struct CircuitDetails_Previews: PreviewProvider {
    static var previews: some View {
        CircuitDetails(circuitViewModel: FormulaViewModel(), circuitID: .constant("bahrain"),selectedYear: .constant("2023"),selectedCountry: .constant("Bahrain"), selectedRound: .constant(""), selectedDate: .constant(""))
            .environmentObject(DataManager())
    }
}
