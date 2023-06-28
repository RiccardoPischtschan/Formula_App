//
//  FormulaResults.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 27.06.23.
//

import Foundation

import CoreData

struct FormulaResults{
    
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
//        let date: String
//        let time: String
//
        let circuitId: String
//        let circuitUrl: String
        let circuitName: String
//
        let lat: String
        let long: String
        let locality: String
        let country: String
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
    
    static func fromRaceResultsResponse (_ raceResponse: RaceResultsResponse) -> FormulaResults {
        
//        let xmlns = raceResponse.MRData.xmlns
//        let series = raceResponse.MRData.series
//        let limit = raceResponse.MRData.limit
//        let offset = raceResponse.MRData.offset
        let total = raceResponse.MRData.total
//
//        let raceTableSeason = raceResponse.MRData.RaceTable.season
//        let raceTableRound  = raceResponse.MRData.RaceTable.round
        
        let season = raceResponse.MRData.RaceTable.Races.season
        let round = raceResponse.MRData.RaceTable.Races.first?.round
//        let url = raceResponse.MRData.RaceTable.Races.first?.url
        let raceName = raceResponse.MRData.RaceTable.Races.first?.raceName
//        let date = raceResponse.MRData.RaceTable.Races.first?.date
//        let time = raceResponse.MRData.RaceTable.Races.first?.time
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
//        let number = raceResponse.MRData.RaceTable.Races.first?.Results.first?.number
//        let position = raceResponse.MRData.RaceTable.Races.first?.Results.first?.position
//        let positionText = raceResponse.MRData.RaceTable.Races.first?.Results.first?.positionText
//        let points = raceResponse.MRData.RaceTable.Races.first?.Results.first?.points
//        let grid = raceResponse.MRData.RaceTable.Races.first?.Results.first?.grid
//        let laps = raceResponse.MRData.RaceTable.Races.first?.Results.first?.laps
//        let status = raceResponse.MRData.RaceTable.Races.first?.Results.first?.status
//
//        let driverId = raceResponse.MRData.RaceTable.Races.first?.Results.first?.Driver.driverId
//        let permanentNumber = raceResponse.MRData.RaceTable.Races.first?.Results.first?.Driver.permanentNumber
//        let code = raceResponse.MRData.RaceTable.Races.first?.Results.first?.Driver.code
//        let driverUrl = raceResponse.MRData.RaceTable.Races.first?.Results.first?.Driver.url
//        let givenName = raceResponse.MRData.RaceTable.Races.first?.Results.first?.Driver.givenName
//        let familyName = raceResponse.MRData.RaceTable.Races.first?.Results.first?.Driver.familyName
//        let dateOfBirth = raceResponse.MRData.RaceTable.Races.first?.Results.first?.Driver.dateOfBirth
//        let nationality = raceResponse.MRData.RaceTable.Races.first?.Results.first?.Driver.nationality
//
//        let constructorId = raceResponse.MRData.RaceTable.Races.first?.Results.first?.Constructor.constructorId
//        let constructorUrl = raceResponse.MRData.RaceTable.Races.first?.Results.first?.Constructor.url
//        let constructorName = raceResponse.MRData.RaceTable.Races.first?.Results.first?.Constructor.name
//        let constructorNationality = raceResponse.MRData.RaceTable.Races.first?.Results.first?.Constructor.nationality
//
//        let millis = raceResponse.MRData.RaceTable.Races.first?.Results.first?.Time?.millis
//        let timeTime = raceResponse.MRData.RaceTable.Races.first?.Results.first?.Time?.time
//
//        let rank = raceResponse.MRData.RaceTable.Races.first?.Results.first?.FastestLap?.rank
//        let lap = raceResponse.MRData.RaceTable.Races.first?.Results.first?.FastestLap?.lap
//
//        let lapTime = raceResponse.MRData.RaceTable.Races.first?.Results.first?.FastestLap?.Time.time
//
//        let units = raceResponse.MRData.RaceTable.Races.first?.Results.first?.FastestLap?.AverageSpeed.units
//        let speed = raceResponse.MRData.RaceTable.Races.first?.Results.first?.FastestLap?.AverageSpeed.speed
//
        return FormulaResults(
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
//            date: date ?? "",
//            time: time ?? "",
            circuitId: circuitId ?? "",
//            circuitUrl: circuitUrl ?? "",
            circuitName: circuitName ?? "",
            lat: lat ?? "",
            long: long ?? "",
            locality: locality ?? "",
            country: country ?? ""
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
