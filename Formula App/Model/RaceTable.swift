//
//  RaceTable.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 21.06.23.
//

import Foundation

struct RaceTable: Codable {
    let season: String
    let round: String
    let Races: [Race]
}
