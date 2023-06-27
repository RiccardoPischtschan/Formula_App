//
//  RaceQualiTable.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 27.06.23.
//

import Foundation

struct RaceQualiTable: Codable {
    let season: String
//    let round: String
    let Races: [RaceQuali]
}
