//
//  String.swift
//  Formula App
//
//  Created by Riccardo Pischtschan on 04.07.23.
//

import Foundation

extension String {
    
    func isValidEmail() -> Bool {
//        test@email.com -> true
//        test.com -> false
        
        let regex = try! NSRegularExpression(pattern:
                                                "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        
        return regex.firstMatch(in: self, range: NSRange(location: 0, length: count)) != nil
    }
}
 func isValidPassword(_ password: String) -> Bool {
//    min 6 characters long
//        1 uppercase character
//        1 special char
    
    let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[A-Z]).{6,}$")
    
    return passwordRegex.evaluate(with: password)
}


