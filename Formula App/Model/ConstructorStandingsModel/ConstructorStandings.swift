//
//  ConstructorStandings.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 14.07.23.
//

import Foundation


struct ConstructorStandings: Codable,Hashable {
    let position: String?
    let points: String?
    let wins: String?
    let Constructor: ConstructorStandingList
}
