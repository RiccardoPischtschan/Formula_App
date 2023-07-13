//
//  StandingsTable.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 13.07.23.
//

import Foundation

struct StandingsTable: Codable,Hashable {
    let season: String?
    let StandingsLists: [StandingsLists]
}
