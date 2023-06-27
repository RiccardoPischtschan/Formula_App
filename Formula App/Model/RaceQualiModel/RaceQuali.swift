//
//  RaceQuali.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 27.06.23.
//

import Foundation

struct RaceQuali: Codable {
    let season: String
    let round: String
//    let url: String
    let raceName: String
    let Circuit: Circuit
//    let date: String
//    let time: String
    let QualifyingResults: [QualiResults]
}
