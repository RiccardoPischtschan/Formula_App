//
//  RaceResultsTable.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 15.08.23.
//


import Foundation

struct RaceResultsTable: Codable, Hashable {
    let season: String
//    let round: String
    let Races: [RaceResults]
}
