//
//  RaceResultItem.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 21.06.23.
//

import Foundation


struct Result: Codable, Hashable{
    
    
    let number: String
    let position: String
    let positionText: String
    let points: String
    let Driver: Driver
    let Constructor: Constructor
    let grid: String
    let laps: String
    let status: String
    let Time: Time?
    let FastestLap: FastestLap?
    
    
}
