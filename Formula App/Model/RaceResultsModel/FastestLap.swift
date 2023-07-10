//
//  FastestLap.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 21.06.23.
//

import Foundation

struct FastestLap: Codable,Hashable {
    let rank: String
    let lap: String
    let Time: LapTime
    let AverageSpeed: AverageSpeed
}
