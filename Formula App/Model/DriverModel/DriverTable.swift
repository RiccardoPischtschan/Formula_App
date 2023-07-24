//
//  DriverTable.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 13.07.23.
//

import Foundation

struct DriverTable: Codable,Hashable {
    let season: String?
    let Drivers : [Drivers]
}
