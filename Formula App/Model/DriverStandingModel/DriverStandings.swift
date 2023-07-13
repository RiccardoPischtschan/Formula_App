//
//  DriverStandings.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 13.07.23.
//

import Foundation

struct DriverStandings: Codable,Hashable {
    let position: String?
    let points: String?
    let wins: String?
    let Driver: DriverInfo
    let Constructors: [ConstructorList]
}
