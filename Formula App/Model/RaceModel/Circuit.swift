//
//  Circuit.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 21.06.23.
//

import Foundation


struct Circuit: Codable, Hashable {
    let circuitId: String
//    let url: String
    let circuitName: String
    let Location: Location
}
