//
//  CircuitDetails.swift
//  FormulaTestApp
//
//  Created by Riccardo Pischtschan on 01.07.23.
//

import SwiftUI

struct CircuitDetails: View {
    var viewModel : FormulaViewModel
    
    
    @Binding var text: String
    var body: some View {
        VStack{
            
//            Text(viewModel.results)
        }
    }
}

struct CircuitDetails_Previews: PreviewProvider {
    static var previews: some View {
        CircuitDetails(viewModel: FormulaViewModel(), text: .constant(""))
    }
}
