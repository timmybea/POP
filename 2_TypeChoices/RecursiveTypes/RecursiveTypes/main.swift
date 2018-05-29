//
//  main.swift
//  RecursiveTypes
//
//  Created by Tim Beals on 2018-05-28.
//  Copyright © 2018 Tim Beals. All rights reserved.
//

import Foundation

//What is a recursive data type: A type that holds instance(s) of its own type, such as linked lists, and trees. They are dynamic and can grow and shrink as other objects are assigned or removed.

class ReferenceNode {
    
    var value: Int
    var next: ReferenceNode?
    
    init(value: Int) {
        self.value = value
    }
}

/*
 //Value type 'ValueNode' cannot have a stored property that recursively contains it!!!!
 //HERE IS THE REASON WHY...
 
struct ValueNode {

    var value: Int
    var next: ValueNode?

    init(value: Int) {
        self.value = value
    }
}

 var one = ValueNode(value: 1)
 var two = ValueNode(value: 2)
 var three = ValueNode(value: 3)

 one.next = two     //UH, OH! THIS IS PASSING A COPY OF TWO...
 two.next = three   //TWO IS NOT CONNECTED TO ONE!! THREE IS PASSING A COPY TO TWO!!!!
*/


class Animal {
    
    var numberOfLegs: Int = 0
    
    func sleeps() {
        print("zzzzz")
    }
    
    func walks() {
        print("walking on \(numberOfLegs) legs")
    }
    
    func speak() {
        print("no sound")
    }
}

class BiPed : Animal {
    
    override init() {
        super.init()
        numberOfLegs = 2
    }
    
    override func speak() {
        print("Hello, I have two legs")
    }
}

//FINAL
//Reduces overhead associated with dynamic dispatch
//Puts a restriction on the class, method, or property
//Can't be subclassed or overridden


