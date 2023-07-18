//
//  QualiResults.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 27.06.23.
//

import Foundation

struct QualiResults: Codable,Hashable {
    var number: String?
    var position: String?
    var Driver: DriverQuali
    var Constructor: ConstructorQuali
    var Q1: String?
    var Q2: String?
    var Q3: String?
}
