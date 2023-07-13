//
//  DriverInfo.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 13.07.23.
//

import Foundation

struct DriverInfo: Codable,Hashable {
    let driverId: String?
    let permanentNumber: String?
    let code: String?
//    let url: String
    let givenName: String?
    let familyName: String?
    let dateOfBirth: String?
    let nationality: String?
}
