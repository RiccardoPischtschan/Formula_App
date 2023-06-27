//
//  ModelWrapper.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 27.06.23.
//

import Foundation

class ModelWrapper {
    private let formula: Formula
    private let formulaResults: FormulaResults
    private let formulaQuali: FormulaQuali
    
    init() {
        
        formula = Formula(total: "", season: "", round: "", raceName: "", circuitId: "", circuitName: "", lat: "", long: "", locality: "", country: "")
        formulaResults = FormulaResults(total: "", season: "", round: "", raceName: "", circuitId: "", circuitName: "", lat: "", long: "", locality: "", country: "")
        formulaQuali = FormulaQuali(total: "", season: "", round: "", raceName: "", circuitId: "", circuitName: "", lat: "", long: "", locality: "", country: "")
    }
    func processInput(_ input: String) -> String {
         
         if input.contains("results") {
             return formulaResults.season
         } else if input.contains("qualifying") {
             return formulaQuali.season
         } else   {
             return formula.season
         }
     }
}
