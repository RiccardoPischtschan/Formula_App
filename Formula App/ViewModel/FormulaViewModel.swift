//
//  Formula.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 21.06.23.
//

import Foundation
import SwiftUI

class FormulaViewModel: ObservableObject{
   
    
    @Published var races = [Race]()
    @Published var results = [RaceResults]()
    @Published var quali = [RaceQuali]()
    @Published var race = [MRData]()
    
    
    
    
    func fetchFormulaApiResponse(_ apiCall :String,_ modelTyp: String){
        
        func create_raw_url( _ apiCall : String,_ modelTyp: String) -> String {
            
            if modelTyp == "race" {
                let base_url = "https://ergast.com/api/f1/\(apiCall).json"
                return base_url
            }
            else if modelTyp.contains("results")  {
                let base_url_results = "https://ergast.com/api/f1/\(apiCall)/\(modelTyp).json"
                return base_url_results
            }
            else if modelTyp.contains("qualifying"){
                let base_url_quali = "https://ergast.com/api/f1/\(apiCall)/\(modelTyp).json"
                return base_url_quali
            }
            return ""
        }
        
        let raw_url = create_raw_url(apiCall,modelTyp)
        let encoded_url = raw_url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        guard encoded_url != nil, let url = URL(string: encoded_url!) else {
            print("Fehler beim Erstellen der URL von \(apiCall)")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data , error == nil else{
                print(error as Any)
                return
            }
            do {
                print(data)
                if modelTyp == "race"{
                    let raceResponse = try JSONDecoder().decode(RaceResponse.self, from: data)
                    print(raceResponse)
                    print("test")
                    
                    DispatchQueue.main.async {
                        self.races = raceResponse.MRData.RaceTable.Races
                    }
                    print(data)
                } else if modelTyp == "total"{
                        let raceResponse = try JSONDecoder().decode(RaceResponse.self, from: data)
                        print(raceResponse)
                        print("test")
                       
                        DispatchQueue.main.async {
                            self.race = [raceResponse.MRData]
                        }
                    
                } else if modelTyp == "results"{
                    let raceResponse = try JSONDecoder().decode(RaceResultsResponse.self, from: data)
                    print(raceResponse)
                     print("test")
                     
                
                    DispatchQueue.main.async {
                        self.results = raceResponse.MRData.RaceTable.Races
                    }
                    
                } else if modelTyp == "qualifying"{
                    let raceResponse = try JSONDecoder().decode(RaceQualiResponse.self, from: data)
                    print(raceResponse)
                     print("test")
                    
                    DispatchQueue.main.async {
                        self.quali = raceResponse.MRData.RaceTable.Races
                    }
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        task.resume()
        
    }
    
}

