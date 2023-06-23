//
//  Formula.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 21.06.23.
//

import Foundation
import SwiftUI
import CoreData

class FormulaViewModel: ObservableObject {
    
    let persistentContainer: NSPersistentContainer
    @Published var formulaDaten: [FormulaDaten] = []
    
    init() {
        persistentContainer = NSPersistentContainer(name: "FormulaData")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Fehler beim Erstellen des ViewModels: \(error.localizedDescription)")
            }
        }
       
        saveAndReadFormulaDaten()
    }
    
    func saveAndReadFormulaDaten() {
        do {
            try persistentContainer.viewContext.save()
            formulaDaten = try persistentContainer.viewContext.fetch(
                NSFetchRequest<FormulaDaten>(entityName: String(describing: FormulaDaten.self))
            )
        } catch {
            print("Fehler beim Speichern oder Lesen der Formula daten: \(error.localizedDescription)")
        }
    }
    
    
    
    func fetchApiResponse( _ season : String) {
        
        func create_raw_url( _ season : String) -> String {
            
            var jahr = "2023"
            let base_url = "https://ergast.com/api/f1/\(season).json"
            return base_url
        }
        
        let raw_url = create_raw_url(season)
        let encoded_url = raw_url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        guard encoded_url != nil, let url = URL(string: encoded_url!) else {
            print("Fehler beim Erstellen der URL von \(season)")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                do {
                    print(data)
                    let raceResponse = try JSONDecoder().decode(RaceResultsResponse.self, from: data)
                    
                    print(data)
                    let formula = Formula.fromRaceResultsResponse(raceResponse)
                    
                    DispatchQueue.main.async {
                        
                        self.createOrUpdateFormulaDaten(season, formula)
                        
                       
                    }
                } catch {
                    print("Fehler beim Decodieren der FormulaResponse: \(error.localizedDescription)")
                }
            } else if let error = error {
                print("Fehler beim Fetchen der Formula daten für \(season): \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }
    
    func updateFormulaDaten(_ formulaDaten: FormulaDaten, _ formula: Formula) {
        formulaDaten.xmlns = formula.xmlns
        formulaDaten.series = formula.series
        formulaDaten.limit = formula.limit
        formulaDaten.offset = formula.offset
        formulaDaten.total = formula.total
        formulaDaten.raceTableSeason = formula.raceTableSeason
       formulaDaten.raceTableRound = formula.raceTableRound
        formulaDaten.season = formula.season
        formulaDaten.round = formula.round
        formulaDaten.url = formula.url
        formulaDaten.raceName = formula.raceName
        formulaDaten.date = formula.date
        formulaDaten.time = formula.time
        formulaDaten.circuitId = formula.circuitId
        formulaDaten.circuitUrl = formula.circuitUrl
        formulaDaten.circuitName = formula.circuitName
        formulaDaten.lat = formula.lat
        formulaDaten.long = formula.long
        formulaDaten.locality = formula.locality
        formulaDaten.country = formula.country
//        formulaDaten.number = formula.number
//        formulaDaten.position = formula.position
//        formulaDaten.positionText = formula.positionText
//        formulaDaten.points = formula.points
//        formulaDaten.grid = formula.grid
//        formulaDaten.laps = formula.laps
//        formulaDaten.status = formula.status
//        formulaDaten.driverId = formula.driverId
//        formulaDaten.permanentNumber = formula.permanentNumber
//        formulaDaten.code = formula.code
//        formulaDaten.driverUrl = formula.driverUrl
//        formulaDaten.givenName = formula.givenName
//        formulaDaten.familyName = formula.familyName
//        formulaDaten.dateOfBirth = formula.dateOfBirth
//        formulaDaten.nationality = formula.nationality
//        formulaDaten.constructorId = formula.constructorId
//        formulaDaten.constructorUrl = formula.constructorUrl
//        formulaDaten.constructorName = formula.constructorName
//        formulaDaten.constructorNationality = formula.constructorNationality
//        formulaDaten.millis = formula.millis
//        formulaDaten.timeTime = formula.timeTime
//        formulaDaten.rank = formula.rank
//        formulaDaten.lap = formula.lap
//        formulaDaten.lapTimeTime = formula.lapTime
//        formulaDaten.units = formula.units
//        formulaDaten.speed = formula.speed
        
        saveAndReadFormulaDaten()
    }
    func createFormulaDaten(_ formula: Formula, _ season: String) {
        let formulaDaten = FormulaDaten(context: persistentContainer.viewContext)
       
        formulaDaten.season = season
        
        updateFormulaDaten(formulaDaten, formula)
    }

    
    func createOrUpdateFormulaDaten(_ season: String, _ formula: Formula) {
        if let existingFormulaDaten = find(season) {
            updateFormulaDaten(existingFormulaDaten, formula)
        } else {
            createFormulaDaten(formula, season)
        }
    }
    func find(_ season: String) -> FormulaDaten? {
        let request = NSFetchRequest<FormulaDaten>(entityName: String(describing: FormulaDaten.self))
        request.predicate = NSPredicate(format: "season == %@", season)
        
        do {
            let results = try persistentContainer.viewContext.fetch(request)
            if results.count > 0 {
                return results.first
            } else {
                return nil
            }
        } catch {
            return nil
        }
    }
}
