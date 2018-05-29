//
//  02_Polymorphism.swift
//  ProtocolBasics
//
//  Created by Tim Beals on 2018-04-23.
//  Copyright © 2018 Tim Beals. All rights reserved.
//

import Foundation

/* Using Protocols as a Type */
//Protocols are considered a full-fledged type in Swift. This means we can use them as a type in collections, properies or function parameters. See the Person Protocol in 01_IntroToProtocols.swift

struct SwiftProgrammer : Person {
    
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
    
    //Programmer implementation added...
}


struct FootballPlayer : Person {
    
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
    
    //Football player implementation added...
}

let Tim = SwiftProgrammer(age: 36, first: "Tim", last: "Beals")
let Messi = FootballPlayer(age: 32, first: "Lionel", last: "Messi")


/* Polymorphism with Protocols */
//Polymorphism allows us to interact with multiple types through a uniform interface.
//In OOP this uniform interface usually comes from a superclass
//In POP this uniform interface usually comes from a protocol.

//Using protocol as a parameter type in a function

func sayPersonName(_ person: Person) {
    print("Hello \(person.getFullName())") //note that getFullName is defined in Person
}

//sayPersonName(Tim)
//sayPersonName(Messi)

//Using protocol as a collection type

var people = [Person]()

//people.append(Tim)
//people.append(Messi)

//If you want to access properties or methods that are not in Person, you will need to use type casting.

