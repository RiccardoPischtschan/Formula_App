//
//  Driver.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 21.06.23.
//

import Foundation

struct Driver: Codable,Hashable {
    let driverId: String
    let permanentNumber: String
    let code: String
//    let url: String
    let givenName: String
    let familyName: String
    let dateOfBirth: String
    let nationality: String
}
