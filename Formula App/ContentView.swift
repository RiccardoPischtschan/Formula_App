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
    private let jahr = ["2024","2023","2022","2021",  "2020", "2019", "2018", "2017",                    "2016", "2015", "2014", "2013", "2012", "2011","2010", "2009",                   "2008", "2007", "2006", "2005", "2004", "2003", "2002", "2001",
                        "2000", "1999","1998","1997","1996","1995","1994","1993","1992","1991",
                        "1990", "1989", "1988", "1987", "1986", "1985", "1984", "1983", "1982", "1981",
                        "1980", "1979", "1978", "1977", "1976", "1975", "1974", "1973", "1972", "1971",
                        "1970", "1969", "1968", "1967", "1966", "1965", "1964", "1963", "1962", "1961",
                        "1960", "1959", "1958", "1957", "1956", "1955", "1954", "1953", "1952", "1951",
                        "1950"]
    
    var filteredData: [(String, String, String)] {
            viewModel.formulaDaten.enumerated().compactMap { index, data in
                if let round = data.round, let circuitName = data.circuitName {
                    return ("Round \(index + 1)", round, circuitName)
                }
                return nil
            }
        }
        
        var body: some View {
            VStack {
                
                VStack {
                    
                    HStack{
                        Text("Season Info")
                            .font(.title)
                            .bold()
                        
                        Picker("Options", selection: $selectedOption) {
                            ForEach(0 ..< jahr.count) { index in
                                Text(jahr[index])
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .frame(width: 100,height: 100)
                        .padding()
                    }
                    
                    List{
                        ForEach(filteredData, id: \.0) { data in
                            HStack{
                                Text(data.0)
                                Text(data.1)
                                Text(data.2)
                            }
                        }
                    }
                }
             }
             .onAppear {
                let selectedYear = jahr[selectedOption]
                viewModel.fetchApiResponse(selectedYear)
             }
             .onChange(of: selectedOption) { newValue in
                let selectedYear = jahr[newValue]
                viewModel.fetchApiResponse(selectedYear)
             }
         }
     }
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
