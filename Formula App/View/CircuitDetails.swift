//
//  CircuitDetails.swift
//  FormulaTestApp
//
//  Created by Riccardo Pischtschan on 01.07.23.
//

import SwiftUI

struct CircuitDetails: View {
    var viewModel : FormulaViewModel
    
    var race : RaceResults
    @Binding var circuitID: String
    @Binding var selectedOption: String
    var body: some View {
        VStack{
            
    
            Text(circuitID.uppercased())
            
                .onAppear{
                    viewModel.fetchFormulaApiResponse("\(selectedOption)/circuits/\(circuitID)/results", "results")
                }
            Text("\(circuitID)")
        }
    }
}

struct CircuitDetails_Previews: PreviewProvider {
    static var previews: some View {
        CircuitDetails(viewModel: FormulaViewModel(),race: RaceResults(season: "", round: "", raceName: "", Circuit: CircuitResults(circuitId: "", circuitName: "", Location: Location(lat: "", long: "", locality: "", country: "")), Results: [Result]()), circuitID: .constant(""),selectedOption: .constant(""))
    }
}
