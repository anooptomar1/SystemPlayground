//
//  PerfCounter.swift
//  SystemPlayground
//
//  Created by Anoop tomar on 12/20/15.
//  Copyright © 2015 Anoop tomar. All rights reserved.
//

import Foundation

class PerfCounter{
    
    class func classPerformance(){
        let startTime = CFAbsoluteTimeGetCurrent()
        var array: [Vehicle]  = []
        for i in 0..<100000{
          array.append(Vehicle(make: "\(i)", model: "\(i)", year: "\(i)"))//, title: "\(i)", one: "\(i)", two: "\(i)", three: "\(i)", four: "\(i)", five: "\(i)", six: "\(i)", seven: "\(i)", eight: "\(i)"))
        }
        
        for n in 0..<100000{
            let _ = array[n]
        }
        
        let elapsedTime = (CFAbsoluteTimeGetCurrent() - startTime)*1000
        print("Time taken for class: \(elapsedTime)")
    }
    class func structPerformance(){
        let startTime = CFAbsoluteTimeGetCurrent()
        var array = [VehicleStruct]()
        for i in 0..<100000{
            array.append(VehicleStruct(make: "\(i)", model: "\(i)", year: "\(i)"))//, title: "\(i)", one: "\(i)", two: "\(i)", three: "\(i)", four: "\(i)", five: "\(i)", six: "\(i)", seven: "\(i)", eight: "\(i)"))
        }
        for n in 0..<100000{
            let _ = array[n]
        }
        let elapsedTime = (CFAbsoluteTimeGetCurrent() - startTime)*1000
        print("Time took for struct: \(elapsedTime)")
    }
}

struct VehicleStruct {
    var make: String
    var model: String
    var year: String
//    var title: String
//    var one:String
//    var two:String
//    var three:String
//    var four:String
//    var five: String
//    var six: String
//    var seven: String
//    var eight: String
   

}


class Vehicle {
    var make: String
    var model: String
    var year: String
//    var title: String
//    var one:String
//    var two:String
//    var three:String
//    var four:String
//    var five: String
//    var six: String
//    var seven: String
//    var eight: String
    
    init(make: String, model: String, year: String){//, title: String, one: String, two: String, three: String, four: String, five: String, six: String, seven: String, eight: String){
        self.make = make
        self.model = model
        self.year = year
//        self.title = title
//        self.one = one
//        self.two = two
//        self.three = three
//        self.four = four
//        self.five = five
//        self.six = six
//        self.seven = seven
//        self.eight = eight
    }
}
