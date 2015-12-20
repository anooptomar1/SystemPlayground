//
//  EqualityTest.swift
//  SystemPlayground
//
//  Created by Anoop tomar on 12/20/15.
//  Copyright © 2015 Anoop tomar. All rights reserved.
//

import Foundation
protocol Named{
    var name: String {get}
}

func ==(lhs:Named, rhs: Named) -> Bool{
    return lhs.name == rhs.name
}

struct car:Named {
    var name: String{
        return "Car"
    }
}

struct motorcycle:Named {
    var name: String{
        return "Motorcycle"
    }
}