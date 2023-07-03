//
//  Funktion.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 03.07.23.
//

import Foundation

func reformatDate(_ dateString: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    
    if let date = dateFormatter.date(from: dateString) {
        dateFormatter.dateFormat = "dd MM yyyy"
        let newDateString = dateFormatter.string(from: date)
        return newDateString
    }
    
    return ""
}
