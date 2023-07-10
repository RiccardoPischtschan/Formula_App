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

func routeLength(for string: String) -> String? {
    let file: String?

    switch string {
    case "bahrain":
        file = "5,412km Corner: 15"
    case "jeddah":
        file = "6,174km Corner: 27"
    case "albert_park":
        file = "5,303km Corner: 16"
    case "baku":
        file = "6,003km Corner: 20"
    case "miami":
        file = "5,412km Corner: 19"
    case "monaco":
        file = "3,337km Corner: 19"
    case "catalunya":
        file = "4,657km Corner: 14"
    case "villeneuve":
        file = "4,361km Corner: 15"
    case "red_bull_ring":
        file = "4,318km Corner: 10"
    case "silverstone":
        file = "5,891km Corner: 18"
    case "hungaroring":
        file = "4,381km Corner: 16"
    case "spa":
        file = "7,004km Corner: 21"
    case "zandvoort":
        file = "4,259km Corner: 15"
    case "monza":
        file = "5,793km Corner: 11"
    case "marina_bay":
        file = "5,063km Corner: 23"
    case "suzuka":
        file = "5,807km Corner: 17"
    case "losail":
        file = "5,380km Corner: 16"
    case "americas":
        file = "5,516km Corner: 20"
    case "rodriguez":
        file = "4,053km Corner: 16"
    case "interlagos":
        file = "4,309km Corner: 15"
    case "vegas":
        file = "6,116km Corner: 17"
    case "yas_marina":
        file = "5,281km Corner: 16"
    case "hockenheimring":
        file = "4,574km Corner: 17"
  
    default:
        file = nil
    }

    return file
}
func trackRecord(for string: String) -> String? {
    let file: String?

    switch string {
    case "bahrain":
        file = "1:30,252 min"
    case "jeddah":
        file = "1:30.734 min"
    case "albert_park":
        file = "1:20,235 min"
    case "baku":
        file = "1:43,009 min"
    case "miami":
        file = "1:31,361 min"
    case "monaco":
        file = "1:12,656 min"
    case "catalunya":
        file = "1:16,330 min"
    case "villeneuve":
        file = "1:13,078 min"
    case "red_bull_ring":
        file = "1:02,939 min"
    case "silverstone":
        file = "1:27,097 min"
    case "hungaroring":
        file = "1:16,627 min"
    case "spa":
        file = "1:46,286 min"
    case "zandvoort":
        file = "1:11,097 min"
    case "monza":
        file = "1:21,046 min"
    case "marina_bay":
        file = "1:41,905 min"
    case "suzuka":
        file = "1:30,983 min"
    case "losail":
        file = "1:53,380 min"
    case "americas":
        file = "1:36,169 min"
    case "rodriguez":
        file = "1:17.774 min"
    case "interlagos":
        file = "1:10,540 min"
    case "vegas":
        file = "No Data"
    case "yas_marina":
        file = "1:26,103 min"
    case "hockenheimring":
        file = "1:13,780 min"
  
    default:
        file = nil
    }

    return file
}
func driverPic(for string: String) -> String? {
    let file: String?

    switch string {
    case "ALB":
        file = "albon"
    case "ALO":
        file = "alonso"
    case "BOT":
        file = "bottas"
    case "DEV":
        file = "de vries"
    case "GAS":
        file = "gasly"
    case "HAM":
        file = "hamilton"
    case "HUL":
        file = "hulkenberg"
    case "MAG":
        file = "magnussen"
    case "LAT":
        file = "latifi"
    case "LEC":
        file = "leclerc"
    case "VER":
        file = "verstappen"
    case "VET":
        file = "vettel"
    case "MSC":
        file = "schumacher"
    case "NOR":
        file = "norris"
    case "OCO":
        file = "ocon"
    case "PER":
        file = "perez"
    case "PIA":
        file = "piastri"
    case "RIC":
        file = "ricciardo"
    case "RUS":
        file = "russell"
    case "SAI":
        file = "sainz"
    case "SAR":
        file = "sargeant"
    case "STR":
        file = "stroll"
    case "TSU":
        file = "tsunoda"
    case "ZHO":
        file = "zhou"
  
    default:
        file = nil
    }

    return file
}
