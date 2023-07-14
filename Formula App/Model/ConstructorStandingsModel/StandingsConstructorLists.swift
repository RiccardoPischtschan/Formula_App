//
//  StandingsConstructorLists.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 14.07.23.
//

import Foundation

struct StandingsConstructorLists: Codable,Hashable {
    let season: String?
    let ConstructorStandings: [ConstructorStandings]
}
