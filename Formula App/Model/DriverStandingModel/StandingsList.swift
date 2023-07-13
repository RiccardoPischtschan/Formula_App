//
//  StandingsList.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 13.07.23.
//

import Foundation

struct StandingsLists: Codable,Hashable {
    let season: String?
    let DriverStandings: [DriverStandings]
}
