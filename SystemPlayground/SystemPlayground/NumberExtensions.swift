//
//  NumberExtensions.swift
//  SystemPlayground
//
//  Created by Anoop tomar on 12/16/15.
//  Copyright © 2015 Anoop tomar. All rights reserved.
//

import Foundation

//%d A signed 32-bit integer
//%u An unsigned 32-bit integer
//%f A 64-bit double
//%e A 64-bit double, printed in scientific notation with a lowercase e before the exponent

extension Double{
    func toString() -> String{
        return String(format: "String: f%", self)
    }
}

extension Int{
    func toString() -> String{
        return String(format: "%02d", self)
    }
}