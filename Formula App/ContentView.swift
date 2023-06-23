//
//  ContentView.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 21.06.23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = FormulaViewModel()
    @State private var selectedOption = 0
    private let jahr = ["2010","2015","2023","2024"]
    var body: some View {
        VStack {
            
            VStack {
                   Text("Gewählte Option: \(jahr[selectedOption])")
                       .padding()
                   
                   Picker("Options", selection: $selectedOption) {
                       ForEach(0 ..< jahr.count) { index in
                           Text(jahr[index])
                       }
                   }
                   .pickerStyle(WheelPickerStyle()) // Stil des Pickers anpassen, falls gewünscht
                   .padding()
               }
            List{
                ForEach(viewModel.formulaDaten){ data in
                    Text(data.circuitName ?? "")
                }
            }
            Button("LoadData"){
                viewModel.fetchApiResponse("2000")
            }
         }
     }
 }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
