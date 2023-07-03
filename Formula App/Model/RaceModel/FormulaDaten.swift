//
//  Formula.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 21.06.23.
//

import CoreData

struct Formula{
    
    
    
//        let xmlns: String
//        let series: String
//        let limit: String
//        let offset: String
        let total: String
//
//        let raceTableSeason: String
//        let raceTableRound: String
        
        let season: String
        let round: String
//        let url: String
        let raceName: String
        let date: String
        let time: String

        let circuitId: String
//        let circuitUrl: String
        let circuitName: String
//
        let lat: String
        let long: String
        let locality: String
        let country: String

    
    static func fromRaceResponse (_ raceResponse: RaceResponse) -> [Formula] {
        var formular = [Formula]()
//        let xmlns = raceResponse.MRData.xmlns
//        let series = raceResponse.MRData.series
//        let limit = raceResponse.MRData.limit
//        let offset = raceResponse.MRData.offset
        let total = raceResponse.MRData.total
//
//        let raceTableSeason = raceResponse.MRData.RaceTable.season
//        let raceTableRound  = raceResponse.MRData.RaceTable.round
        
//        Schleife
        for race in raceResponse.MRData.RaceTable.Races {
            
            
        let season = race.season
            let round = race.round
//        let url = raceResponse.MRData.RaceTable.Races.first?.url
            let raceName = race.raceName
        let date = race.date
        let time = race.time
//
        let circuitId = race.Circuit.circuitId
//        let circuitUrl = raceResponse.MRData.RaceTable.Races.first?.Circuit.url
        let circuitName = race.Circuit.circuitName
//
        let lat = race.Circuit.Location.lat
        let long = race.Circuit.Location.long
        let locality = race.Circuit.Location.locality
        let country = race.Circuit.Location.country
            
            var formula : Formula = Formula(total: total, season: season, round: round, raceName: raceName, date: date, time: time ?? "", circuitId: circuitId, circuitName: circuitName, lat: lat, long: long, locality: locality, country: country)
            
            formular.append(formula)
       }
print("Test \(formular)" )
//
        return formular
//

        
    }
}
