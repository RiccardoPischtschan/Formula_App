//
//  CircuitDetails.swift
//  FormulaTestApp
//
//  Created by Riccardo Pischtschan on 01.07.23.
//

import SwiftUI

struct CircuitDetails: View {
    var viewModel : FormulaViewModel
    @EnvironmentObject var firebaseAuth: FirebaseAuthService
    var race : RaceResults
    @Binding var circuitID: String
    @Binding var selectedOption: String
    var body: some View {
        ZStack{
           Color.black
            VStack{
                
                HStack{
                    Image("\(circuitID.prefix(1).capitalized + circuitID.dropFirst().lowercased()) 1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50,height: 50)
                    Text(circuitID.uppercased())
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                }
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
                
                
                Text(selectedOption)
                    .onAppear{
//                        viewModel.fetchFormulaApiResponse("/circuits/\(circuitID)", "race")
                    }
                Text("\(circuitID)")
                
            }
        }
        .ignoresSafeArea()
    }
}

struct CircuitDetails_Previews: PreviewProvider {
    static var previews: some View {
        CircuitDetails(viewModel: FormulaViewModel(),race: RaceResults(season: "", round: "", raceName: "", Circuit: CircuitResults(circuitId: "bahrain", circuitName: "", Location: Location(lat: "", long: "", locality: "", country: "")), Results: [Result]()), circuitID: .constant("bahrain"),selectedOption: .constant(""))
    }
}
