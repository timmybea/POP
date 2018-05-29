//
//  04_DelegateMethod.swift
//  ProtocolBasics
//
//  Created by Tim Beals on 2018-04-23.
//  Copyright © 2018 Tim Beals. All rights reserved.
//

import Foundation

/* Delegation */
//One instance acts on behalf of another. Protocol defines what actions the delegate will perform.
//Provides loose coupling... any delegate can perform the task so we are not relying on a particular class.

protocol DisplayNameDelegate {
    func displayName(_ name: String)
}

protocol HasFullName : FullName {
    var displayNameDelegate: DisplayNameDelegate? { get set }
}



class Parent : Person, HasFullName {
    
    var displayNameDelegate: DisplayNameDelegate?
    
    required init(age: Int, first: String, last: String) {
        self.age = age
        self.firstName = first
        self.lastName = last
    }
    
    var age: Int
    
    var firstName: String
    
    var lastName: String
    
    func getFullName() -> String {
        return "\(firstName) \(lastName)"
    }
    
    func displayName() {
        self.displayNameDelegate?.displayName(getFullName())
    }
    
}


class DisplayName : DisplayNameDelegate {
    
    func displayName(_ name: String) {
        print("DISPLAY NAME: \(name)")
    }
}

let parent = Parent(age: 36, first: "Tara", last: "Beals")
let display = DisplayName()

//parent.displayNameDelegate = display
//parent.displayName()

