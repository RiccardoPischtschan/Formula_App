//
//  Formula.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 21.06.23.
//

import Foundation
import SwiftUI
import Firebase

class FormulaViewModel: ObservableObject{
    
    
    @Published var races = [Race]()
    @Published var results = [Result]()
    @Published var quali = [QualiResults]()
    @Published var total = [MRData]()
    @Published var driver = [DriverStandings]()
    @Published var constructor = [ConstructorStandings]()
    @Published var driverInfo = [Drivers]()
    
    

    
    
    
    func fetchFormulaApiResponse(_ apiCall :String,_ modelTyp: String){
        
        func create_raw_url( _ apiCall : String,_ modelTyp: String) -> String {
            
            if modelTyp == "race" {
                let base_url = "https://ergast.com/api/f1/\(apiCall).json"
                return base_url
            }
            else if modelTyp.contains("results")  {
                let base_url_results = "https://ergast.com/api/f1/\(apiCall)/results.json"
                return base_url_results
            }
            else if modelTyp.contains("qualifying"){
                let base_url_quali = "https://ergast.com/api/f1/\(apiCall)/qualifying.json"
                return base_url_quali
            }
            else if modelTyp.contains("driver"){
                let base_url_quali = "https://ergast.com/api/f1/\(apiCall).json"
                return base_url_quali
            }
            else if modelTyp.contains("constructor"){
                let base_url_quali = "https://ergast.com/api/f1/\(apiCall).json"
                return base_url_quali
            }
            else if modelTyp.contains("driverInfo"){
                let base_url_quali = "https://ergast.com/api/f1/\(apiCall).json"
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
                        self.total = [raceResponse.MRData]
                    }
                    
                } else if modelTyp == "results"{
                    let raceResponse = try JSONDecoder().decode(RaceResultsResponse.self, from: data)
                    print(raceResponse)
                    print("test")
                    
                    
                    DispatchQueue.main.async {
                        self.results = raceResponse.MRData.RaceTable.Races.flatMap{$0.Results}
                    }
                    
                } else if modelTyp == "qualifying"{
                    let raceResponse = try JSONDecoder().decode(RaceQualiResponse.self, from: data)
                    print(raceResponse)
                    print("test")
                    
                    DispatchQueue.main.async {
                        self.quali = raceResponse.MRData.RaceTable.Races.flatMap{$0.QualifyingResults}
                        
                    }
                
                } else if modelTyp == "driver"{
                    let raceResponse = try JSONDecoder().decode(DriverStandingResponse.self, from: data)
                    print(raceResponse)
                    print("test")
                    
                    DispatchQueue.main.async {
                        self.driver = raceResponse.MRData.StandingsTable.StandingsLists[0].DriverStandings
                        
                    }
                } else if modelTyp == "driverInfo"{
                        let raceResponse = try JSONDecoder().decode(DriverResponse.self, from: data)
                        print(raceResponse)
                        print("test")
                        
                        DispatchQueue.main.async {
                            self.driverInfo = raceResponse.MRData.DriverTable.Drivers
                            
                        }
                } else if modelTyp == "constructor"{
                    let raceResponse = try JSONDecoder().decode(ConstructorStandingResponse.self, from: data)
                     print(raceResponse)
                     print("test")
                 
                     DispatchQueue.main.async {
                         self.constructor = raceResponse.MRData.StandingsTable.StandingsLists[0].ConstructorStandings
                     
                  }
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        task.resume()
        
    }
}
