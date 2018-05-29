//
//  03_TypeCastingAndAssociatedTypes.swift
//  ProtocolBasics
//
//  Created by Tim Beals on 2018-04-23.
//  Copyright © 2018 Tim Beals. All rights reserved.
//

import Foundation

/* Type casting and associated types with protocols */
//is v as : Checks if instance IS a certain type or treats it as a type.


//for person in people where person is SwiftProgrammer {
//    print("\(person.firstName) is a programmer")
//}
//
////Downcasting: as? and as! ... Upcasting: as (this will always succeed)
//for person in people {
//
//    if let p = person as? SwiftProgrammer {
//        print("\(p.firstName) is a programmer")
//    }
//
//}


//AssociatedType: is a placeholder name. Actual type not defined until the protocol is adopted.

protocol Queue {
    associatedtype T
    
    func addItem(_ item: T)
    func getItem() -> T?
    func count() -> Int
}

//
//class OneWay : Queue {
//    typealias T = Int
//
//    ...
//
//}
//
//class AnotherWay<T> : Queue {
//
//    ...
//}


//This is a non-generic implementation
class IntQueue: Queue {
    
    typealias T = Int
    
    private var items = [Int]()
    
    func addItem(_ item: Int) {
        items.append(item)
    }
    
    func getItem() -> Int? {
        return items.count > 0 ? items.remove(at: 0) : nil
    }
    
    func count() -> Int {
        return self.items.count
    }
    
}

class AnotherQueue<T>: Queue {
    
    private var items = [T]()
    
    func addItem(_ item: T) {
        items.append(item)
    }
    
    func getItem() -> T? {
        return items.count > 0 ? items.remove(at: 0) : nil
    }
    
    func count() -> Int {
        return items.count
    }
}


//let a = AnotherQueue<String>()
//a.addItem("Hello")

