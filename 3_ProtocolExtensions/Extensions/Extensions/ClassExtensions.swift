//
//  ClassExtensions.swift
//  Extensions
//
//  Created by Tim Beals on 2018-05-29.
//  Copyright © 2018 Tim Beals. All rights reserved.
//

import Foundation

//You can extend types: Structures, enumerations, classes
//Example of using extension to extend a native type.

extension String {
    
    func getFirstCharacter() -> Character? {
        guard self.count > 0 else { return nil }
        return self[startIndex]
    }
    
    var firstCharacter: Character? { //Computed property only
        guard self.count > 0 else { return nil }
        return self[startIndex]
    }
    
    subscript(r: CountableClosedRange<Int>) -> String {
        get {
            let start = index(self.startIndex, offsetBy: r.lowerBound)
            let end = index(self.startIndex, offsetBy: r.upperBound)
            return String(self[start..<end])
        }
    }
}

//var string = "Hello, world"
//
//let a = string[3...6]
//print(a)


extension Collection where Iterator.Element : Comparable {
    //add implementation
}
