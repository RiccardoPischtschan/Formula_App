//
//  Drivers.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 13.07.23.
//

import Foundation

struct Drivers: Codable,Hashable {
    let driverId: String
    let permanentNumber: String
    let code: String
    let givenName: String
    let familyName: String
    let dateOfBirth: String
    let nationality: String
}
