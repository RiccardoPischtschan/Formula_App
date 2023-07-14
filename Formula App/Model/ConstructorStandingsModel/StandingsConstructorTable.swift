//
//  StandingsConstructorTable.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 14.07.23.
//

import Foundation

struct StandingsConstructorTable: Codable,Hashable {
    let season: String?
    let StandingsLists: [StandingsConstructorLists]
}
