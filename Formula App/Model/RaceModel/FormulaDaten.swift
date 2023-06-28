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

    
    static func fromRaceResponse (_ raceResponse: RaceResponse) -> Formula {
        
//        let xmlns = raceResponse.MRData.xmlns
//        let series = raceResponse.MRData.series
//        let limit = raceResponse.MRData.limit
//        let offset = raceResponse.MRData.offset
        let total = raceResponse.MRData.total
//
//        let raceTableSeason = raceResponse.MRData.RaceTable.season
//        let raceTableRound  = raceResponse.MRData.RaceTable.round
        
        let season = raceResponse.MRData.RaceTable.Races.first?.season
        let round = raceResponse.MRData.RaceTable.Races.first?.round
//        let url = raceResponse.MRData.RaceTable.Races.first?.url
        let raceName = raceResponse.MRData.RaceTable.Races.first?.raceName
        let date = raceResponse.MRData.RaceTable.Races.first?.date
        let time = raceResponse.MRData.RaceTable.Races.first?.time
//
        let circuitId = raceResponse.MRData.RaceTable.Races.first?.Circuit.circuitId
//        let circuitUrl = raceResponse.MRData.RaceTable.Races.first?.Circuit.url
        let circuitName = raceResponse.MRData.RaceTable.Races.first?.Circuit.circuitName
//
        let lat = raceResponse.MRData.RaceTable.Races.first?.Circuit.Location.lat
        let long = raceResponse.MRData.RaceTable.Races.first?.Circuit.Location.long
        let locality = raceResponse.MRData.RaceTable.Races.first?.Circuit.Location.locality
        let country = raceResponse.MRData.RaceTable.Races.first?.Circuit.Location.country
//

//
        return Formula(
//            xmlns: xmlns,
//            series: series,
//            limit: limit,
//            offset: offset,
            total: total,
//            raceTableSeason: raceTableSeason,
//            raceTableRound: raceTableRound
            season: season ?? "",
            round: round ?? "",
//            url: url ?? "",
            raceName: raceName ?? "",
            date: date ?? "",
            time: time ?? "",
            circuitId: circuitId ?? "",
//            circuitUrl: circuitUrl ?? "",
            circuitName: circuitName ?? "",
            lat: lat ?? "",
            long: long ?? "",
            locality: locality ?? "",
            country: country ?? ""

        )
    }
}
