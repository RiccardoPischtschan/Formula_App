//
//  MRQualiData.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 27.06.23.
//

import Foundation


struct MRQualiData: Codable,Hashable {
//    let xmlns: String
//    let series: String
//    let limit: String
//    let offset: String
    let total: String
    let RaceTable: RaceQualiTable
}
