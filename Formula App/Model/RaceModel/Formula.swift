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
//        let round: String
//        let url: String
//        let raceName: String
//        let date: String
//        let time: String
//
//        let circuitId: String
//        let circuitUrl: String
//        let circuitName: String
//
//        let lat: String
//        let long: String
//        let locality: String
//        let country: String
//
//        let number: String
//        let position: String
//        let positionText: String
//        let points: String
//
//        let grid: String
//        let laps: String
//        let status: String
//
//        let driverId: String
//        let permanentNumber: String?
//        let code: String
//        let driverUrl: String
//        let givenName: String
//        let familyName: String
//        let dateOfBirth: String
//        let nationality: String
//
//        let constructorId: String
//        let constructorUrl: String
//        let constructorName: String
//        let constructorNationality: String
//
//        let millis: String
//        let timeTime: String
//
//        let rank: String
//        let lap: String
//
//        let lapTime: String
//
//        let units: String
//        let speed: String
    
    static func fromRaceResultsResponse (_ raceResultsResponse: RaceResponse) -> Formula {
        
//        let xmlns = raceResultsResponse.MRData.xmlns
//        let series = raceResultsResponse.MRData.series
//        let limit = raceResultsResponse.MRData.limit
//        let offset = raceResultsResponse.MRData.offset
        let total = raceResultsResponse.MRData.total
//
//        let raceTableSeason = raceResultsResponse.MRData.RaceTable.season
//        let raceTableRound  = raceResultsResponse.MRData.RaceTable.round
        
        let season = raceResultsResponse.MRData.RaceTable.Races.first?.season
//        let round = raceResultsResponse.MRData.RaceTable.Races.first?.round
//        let url = raceResultsResponse.MRData.RaceTable.Races.first?.url
//        let raceName = raceResultsResponse.MRData.RaceTable.Races.first?.raceName
//        let date = raceResultsResponse.MRData.RaceTable.Races.first?.date
//        let time = raceResultsResponse.MRData.RaceTable.Races.first?.time
//
//        let circuitId = raceResultsResponse.MRData.RaceTable.Races.first?.Circuit.circuitId
//        let circuitUrl = raceResultsResponse.MRData.RaceTable.Races.first?.Circuit.url
//        let circuitName = raceResultsResponse.MRData.RaceTable.Races.first?.Circuit.circuitName
//
//        let lat = raceResultsResponse.MRData.RaceTable.Races.first?.Circuit.Location.lat
//        let long = raceResultsResponse.MRData.RaceTable.Races.first?.Circuit.Location.long
//        let locality = raceResultsResponse.MRData.RaceTable.Races.first?.Circuit.Location.locality
//        let country = raceResultsResponse.MRData.RaceTable.Races.first?.Circuit.Location.country
//
//        let number = raceResultsResponse.MRData.RaceTable.Races.first?.Results.first?.number
//        let position = raceResultsResponse.MRData.RaceTable.Races.first?.Results.first?.position
//        let positionText = raceResultsResponse.MRData.RaceTable.Races.first?.Results.first?.positionText
//        let points = raceResultsResponse.MRData.RaceTable.Races.first?.Results.first?.points
//        let grid = raceResultsResponse.MRData.RaceTable.Races.first?.Results.first?.grid
//        let laps = raceResultsResponse.MRData.RaceTable.Races.first?.Results.first?.laps
//        let status = raceResultsResponse.MRData.RaceTable.Races.first?.Results.first?.status
//
//        let driverId = raceResultsResponse.MRData.RaceTable.Races.first?.Results.first?.Driver.driverId
//        let permanentNumber = raceResultsResponse.MRData.RaceTable.Races.first?.Results.first?.Driver.permanentNumber
//        let code = raceResultsResponse.MRData.RaceTable.Races.first?.Results.first?.Driver.code
//        let driverUrl = raceResultsResponse.MRData.RaceTable.Races.first?.Results.first?.Driver.url
//        let givenName = raceResultsResponse.MRData.RaceTable.Races.first?.Results.first?.Driver.givenName
//        let familyName = raceResultsResponse.MRData.RaceTable.Races.first?.Results.first?.Driver.familyName
//        let dateOfBirth = raceResultsResponse.MRData.RaceTable.Races.first?.Results.first?.Driver.dateOfBirth
//        let nationality = raceResultsResponse.MRData.RaceTable.Races.first?.Results.first?.Driver.nationality
//
//        let constructorId = raceResultsResponse.MRData.RaceTable.Races.first?.Results.first?.Constructor.constructorId
//        let constructorUrl = raceResultsResponse.MRData.RaceTable.Races.first?.Results.first?.Constructor.url
//        let constructorName = raceResultsResponse.MRData.RaceTable.Races.first?.Results.first?.Constructor.name
//        let constructorNationality = raceResultsResponse.MRData.RaceTable.Races.first?.Results.first?.Constructor.nationality
//
//        let millis = raceResultsResponse.MRData.RaceTable.Races.first?.Results.first?.Time?.millis
//        let timeTime = raceResultsResponse.MRData.RaceTable.Races.first?.Results.first?.Time?.time
//
//        let rank = raceResultsResponse.MRData.RaceTable.Races.first?.Results.first?.FastestLap?.rank
//        let lap = raceResultsResponse.MRData.RaceTable.Races.first?.Results.first?.FastestLap?.lap
//
//        let lapTime = raceResultsResponse.MRData.RaceTable.Races.first?.Results.first?.FastestLap?.Time.time
//
//        let units = raceResultsResponse.MRData.RaceTable.Races.first?.Results.first?.FastestLap?.AverageSpeed.units
//        let speed = raceResultsResponse.MRData.RaceTable.Races.first?.Results.first?.FastestLap?.AverageSpeed.speed
//
        return Formula(
//            xmlns: xmlns,
//            series: series,
//            limit: limit,
//            offset: offset,
            total: total,
//            raceTableSeason: raceTableSeason,
//            raceTableRound: raceTableRound
            season: season ?? ""
//            round: round ?? "",
//            url: url ?? "",
//            raceName: raceName ?? "",
//            date: date ?? "",
//            time: time ?? "",
//            circuitId: circuitId ?? "",
//            circuitUrl: circuitUrl ?? "",
//            circuitName: circuitName ?? "",
//            lat: lat ?? "",
//            long: long ?? "",
//            locality: locality ?? "",
//            country: country ?? "",
//            number: number ?? "",
//            position: position ?? "",
//            positionText: positionText ?? "",
//            points: points ?? "",
//            grid: grid ?? "",
//            laps: laps ?? "",
//            status: status ?? "",
//            driverId: driverId ?? "",
//            permanentNumber: permanentNumber,
//            code: code ?? "",
//            driverUrl: driverUrl ?? "",
//            givenName: givenName ?? "",
//            familyName: familyName ?? "",
//            dateOfBirth: dateOfBirth ?? "",
//            nationality: nationality ?? "",
//            constructorId: constructorId ?? "",
//            constructorUrl: constructorUrl ?? "",
//            constructorName: constructorName ?? "",
//            constructorNationality: constructorNationality ?? "",
//            millis: millis ?? "",
//            timeTime: timeTime ?? "",
//            rank: rank ?? "",
//            lap: lap ?? "",
//            lapTime: lapTime ?? "",
//            units: units ?? "",
//            speed: speed ?? ""
        )
    }
}
