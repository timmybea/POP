//
//  main.swift
//  ProtocolBasics
//
//  Created by Tim Beals on 2018-04-23.
//  Copyright © 2018 Tim Beals. All rights reserved.
//

import Foundation

/* Designing with Protocols */
//Using protocols instead of superclasses.
//Better to break the desing into smaller, specific protocols: Interface Segregation Principle.
//TIP: Create a graphical tree hierarchy... a good example to see how protocols are used extensively in design is http://swiftdoc.org/ You can see the tree for any type in swift.

protocol RobotMovement {
    func forward(speedPercent: Double)
    func backward(speedPercent: Double)
    func left(speedPercent: Double)
    func right(speedPercent: Double)
    func stop()
}

protocol RobotMovementThreeDimensions : RobotMovement {
    func up(speedPercent: Double)
    func down(speedPercent: Double)
}

protocol Sensor {
    var sensorName: String { get }
    var sensorType: String { get }
    init(sensorName: String)
    func pollSensor()
}

protocol EnvironmentSensor: Sensor {
    func currentTemperature() -> Double
    func currentHumidity() -> Double
}

protocol RangeSensor : Sensor {
    func setRangeNotification(rangeCentimeter: Double, rangeNotification: () -> Void)
    func currentRange() -> Double
}

//Now we can use protocols as property types to promote polymorphism and have a fully customizable robot.
protocol Robot {
    var name : String { get set }
    
    var robotMovement: RobotMovement { get set }
    var sensors: [Sensor] { get }
    init(name: String, robotMovement: RobotMovement)
    func addSensor(_ sensor: Sensor)
    func pollSensors()
}


