//
//  01_IntroToProtocols.swift
//  ProtocolBasics
//
//  Created by Tim Beals on 2018-04-23.
//  Copyright © 2018 Tim Beals. All rights reserved.
//

import Foundation

/* Protocol Syntax and Inheritance */

protocol ExampleProtocol {
    //defining properties
    var readWriteProperty: String { get set }
    var readOnlyProperty: String { get }
    static var typeProperty: String { get set }
    
    //defining methods
    func nameOfMethod(parameter: String) -> Bool
    static func anotherMethod()
}


//example
protocol FullName {
    var firstName: String { get set }
    var lastName: String { get set }
    func getFullName() -> String
}

protocol Person : FullName {
    init(age: Int, first: String, last: String)
    var age: Int { get set }
    
}

//optional properties and methods can be added
@objc protocol Phone {
    var phoneNumber: String { get set }
    @objc optional var emailAddress: String { get set }
    func dialNumber()
    @objc optional func getEmailAddress()
}


//adopting the protocol
struct Student : Person {
    var age: Int
    var firstName: String
    var lastName: String
    
    init(age: Int, first: String, last: String) {
        self.age = age
        self.firstName = first
        self.lastName = last
    }
    
    func getFullName() -> String {
        return "\(firstName) \(lastName)"
    }
}
