//
//  ReceResult.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 21.06.23.
//

import Foundation


struct Race: Codable {
    let season: String
    let round: String
    let url: String
    let raceName: String
    let Circuit: Circuit
    let date: String
    let time: String
//    let Results: [Result]
}

