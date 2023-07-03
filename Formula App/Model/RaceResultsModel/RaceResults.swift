//
//  RaceResults.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 27.06.23.
//

import Foundation

struct RaceResults: Codable {
    let season: String
    let round: String
//    let url: String
    let raceName: String
    let Circuit: CircuitResults
//    let date: String
//    let time: String
    let Results: [Result]
    
    static var raceResultsCheat = RaceResults(season: "", round: "", raceName: "", Circuit: CircuitResults(circuitId: "", circuitName: "", Location: Location(lat: "", long: "", locality: "", country: "")),Results: [Result]())
}
