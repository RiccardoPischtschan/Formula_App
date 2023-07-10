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
  
    @Binding var circuitID: String
    @Binding var selectedYear: String
    @Binding var selectedCountry: String
    @Binding var selectedRound: String
    var body: some View {
        ZStack{
            Color.black
            VStack{
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
                                    .foregroundColor(.red)
                                
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
                        .overlay(.red)
                    
                    Text("Race Results \(selectedYear)")
                        .bold()
                        .font(.title2)
                        .foregroundColor(.white)
                    
                    ForEach(circuitViewModel.results, id: \.self){ result in
                        RaceRow(race: result)
                        
                    }
                    //                .onAppear{
                    //                    circuitViewModel.fetchFormulaApiResponse("\(selectedYear)/5","results")
                    //                }
                    //                Button("Test"){
                    //                    circuitViewModel.fetchFormulaApiResponse("\(selectedYear)/5","results")
                    //                }
                    
                    
                }
                .frame(width: 360)
                .onAppear{
                    circuitViewModel.fetchFormulaApiResponse("\(selectedYear)/\(selectedRound)","results")
                }
                
                
                
                
            }
        }
            .frame(height: 700)
            .offset(y: 30)
        }
        .ignoresSafeArea()
    }
}

struct CircuitDetails_Previews: PreviewProvider {
    static var previews: some View {
        CircuitDetails(circuitViewModel: FormulaViewModel(), circuitID: .constant("bahrain"),selectedYear: .constant("2023"),selectedCountry: .constant("Bahrain"), selectedRound: .constant(""))
    }
}
