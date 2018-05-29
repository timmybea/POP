//
//  main.swift
//  PartOne
//
//  Created by Tim Beals on 2018-05-28.
//  Copyright © 2018 Tim Beals. All rights reserved.
//

import Foundation

//access controls: property, method, class etc.
//open: (classes and class members) can be subclassed/overridden within the module thay are defined in OR any module that has imported the module that they are defined in..
//public: (classes and class members) can only be subclassed/overridden within the module thay are defined in.
//internal: default. accessible within the defining module.
//fileprivate: accessible anywhere within the sourcefile that defines it.
//private: only accessible within the entity that has declared it.

//Access control principle: You can only use an access control that is equal or more private than a higher order entity which contains it. eg: "fileprivate class" cannot hold "public var"


//Enumerations: A named, value type

enum Devices : String { //raw values
    case iPad = "iPad"
    case iPhone = "iPhone"
    case iPod = "iPod"
}

Devices.iPad.rawValue

enum Devices2 { //associated values.
    case iPod(model: String, year: Int, memory: Int)
    case iPhone(model: String, memory: Int)
    case iPad(model: String, memory: Int)
}

let myDevice = Devices2.iPhone(model: "X", memory: 64)

//two methods for pulling out associated values.
if case let Devices2.iPhone(model, memory) = myDevice, model == "X" {
    print("You selected iPhone \(model), \(memory)GB ")
}

switch myDevice {
case .iPod(let model, let year, let memory):
    print("\(model), \(year), \(memory)")
default:
    print("something else...")
}


//A more efficient idea is putting
enum BookFormat {
    case PaperBack(pageCount: Int, price: Float)
    case HardCover(pageCount: Int, price: Float)
    case PDF(pageCount: Int, price: Float)
    
    var pageCount: Int {
        switch self {
        case .PaperBack(let pageCount, _):
            return pageCount
        case .HardCover(let pageCount, _):
            return pageCount
        case .PDF(let pageCount, _):
            return pageCount
        }
    }
    
    var price: Float {
        switch self {
        case .PaperBack(_, let price):
            return price
        case .HardCover(_ , let price):
            return price
        case .PDF(_, let price):
            return price
        }
    }
    
    func purchaseTogether(other: BookFormat) -> Float {
        return (self.price + other.price) * 0.8
    }
}

let book = BookFormat.PaperBack(pageCount: 364, price: 20.99)
//print("\(book.price)")

//discount for purchasing together
let anotherBook = BookFormat.PDF(pageCount: 287, price: 14.99)
var discountPrice = book.purchaseTogether(other: anotherBook)

//print("discounted price: \(discountPrice)")

enum Reindeer: String {
    case Dasher, Dancer, Prancer, Vixen, Comet, Cupid, Donner, Blitzen, Rudolph
    
    static var allCases: [Reindeer] {
        return [Dasher, Dancer, Prancer, Vixen, Comet, Cupid, Donner, Blitzen, Rudolph]
    }
    
    static func randomReindeer() -> Reindeer {
        let index = Int(arc4random_uniform(UInt32(allCases.count)))
        return allCases[index]
    }
}

//tuples: These are perfect for temporary collections of values, especially of different types.

let mathGrade = ("Jon", 100)
let (name, score) = mathGrade  //destructuring.
//print("\(name) \(score)")

let anotherGrade = (name: "Tim", score: 98) //named tuple
//print("\(anotherGrade.name)")

//Use a typealias to have reusable named tuple.

typealias tip = (tipAmount: Float, totalAmount: Float)

func calculateTip(billAmount: Float, tipPercentage: Float) -> tip {
    let tipAmount = billAmount * (tipPercentage / 100)
    let total = tipAmount + billAmount
    return (tipAmount, total)
}

let result = calculateTip(billAmount: 80, tipPercentage: 22)
//print(result.tipAmount)



//value and reference types

struct MyValueType {
    var name: String
    var assignment: String
    var grade: Int
    
    //structs have a default initializer
}

class MyReferenceType {
    var name: String
    var assignment: String
    var grade: Int
    
    init(name: String, assignment: String, grade: Int) {
        self.name = name
        self.assignment = assignment
        self.grade = grade
    }
}

var ref = MyReferenceType(name: "John", assignment: "English", grade: 82)
var val = MyValueType(name: "Francis", assignment: "Math", grade: 66)

func extraCredit(refType: MyReferenceType, amount: Int) {
    refType.grade += amount
}

func extraCredit(valType: MyValueType, amount: Int) {
    // if method, you could use 'mutating'
    var valType = valType
    valType.grade += amount
}

extraCredit(refType: ref, amount: 30)
//print("\(ref.name): grade: \(ref.grade)") //John: grade: 112

extraCredit(valType: val, amount: 30)
//print("\(val.name): grade \(val.grade)") //Francis: grade 66


//REFERENCE DEMONSTRATION
//func getGradeForAssignment(_ assignment: MyReferenceType) {
//    let num = Int(arc4random_uniform(20) + 80)
//    assignment.grade = num
//    print("Grade for assignment \(assignment.name) is \(assignment.grade)")
//}
//
//
//var mathGrades = [MyReferenceType]()
//var students = ["Jon", "Kim", "Kelly", "Phillip"]
//var mathAssignment = MyReferenceType(name: "", assignment: "English 01", grade: 0)
//
//for student in students {
//    mathAssignment.name = student
//    getGradeForAssignment(mathAssignment)
//    mathGrades.append(mathAssignment)
//}
//
//for assignment in mathGrades {
//    print("Assignment \(assignment.name): \(assignment.grade)")
//}

//func getGradeForAssignment(_ assignment: inout MyValueType) {
//    let num = Int(arc4random_uniform(20) + 80)
//    assignment.grade = num
//    print("Grade for assignment \(assignment.name) is \(assignment.grade)")
//}


var mathGrades = [MyValueType]()
var students = ["Jon", "Kim", "Kelly", "Phillip"]
var scores = [66, 77, 88, 99]
var mathAssignment = MyValueType(name: "", assignment: "English 01", grade: 0)

for (index, student) in students.enumerated() {
    mathAssignment.name = student
    mathAssignment.grade = scores[index]
    //getGradeForAssignment(&mathAssignment)
    mathGrades.append(mathAssignment)
}

for assignment in mathGrades {
    print("Assignment \(assignment.name): \(assignment.grade)")
}
