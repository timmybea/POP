//
//  main.swift
//  Extensions
//
//  Created by Tim Beals on 2018-05-28.
//  Copyright © 2018 Tim Beals. All rights reserved.
//

import Foundation

protocol TextValidation {
    var regExMatchingString: String { get } //verifies only valid characters used
    var validationMessage: String { get } //error message
}


extension TextValidation {
    
    var regFindMatchString: String {
        get {
            return regExMatchingString + "$"
        }
    }
    
    func validateString(_ str: String) -> Bool {
        if let _ = str.range(of: regExMatchingString,
                             options: .regularExpression) {
            return true
        } else {
            return false
        }
    }
    
    func getMatchingString(_ str: String) -> String? {
        if let newMatch = str.range(of: regExMatchingString, options: .regularExpression) {
            return String(str[newMatch])
        } else {
            return nil
        }
    }
}

class AlphabeticValidation : TextValidation {
    static let shared = AlphabeticValidation()
    private init() {}
    
    var regExMatchingString: String = "^[a-zA-Z]{0,10}" //A Java expression
    var validationMessage: String = "Can only contain alpha characters"
    
    func validateString(_ str: String) -> Bool {
        print("THIS IS OVERRIDING THE EXTENSION METHOD")
        return false
    }
}

class AlphanumericValidation : TextValidation {
    static let shared = AlphanumericValidation()
    private init() {}
    
    var regExMatchingString: String = "^[a-zA-Z0-9]{0,15}"
    var validationMessage: String = "Can only contain alpha numeric characters"
}

var myString1 = "abcXYZ"
var myString2 = "53"
var validation = AlphabeticValidation.shared
print(validation.validateString(myString1))
print(validation.validateString(myString2))

print(validation.getMatchingString(myString1))
print(validation.getMatchingString(myString2))


//Conforming to the equatable protocol
struct Place {
    let id : String
    let latitude: Double
    let longitude: Double
}

extension Place : Equatable {
    
    static func ==(lhs: Place, rhs: Place) -> Bool {
        return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
    
}






