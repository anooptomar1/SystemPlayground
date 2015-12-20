//
//  ProtocolExtensions.swift
//  SystemPlayground
//
//  Created by Anoop tomar on 12/20/15.
//  Copyright © 2015 Anoop tomar. All rights reserved.
//

import Foundation
// integer extension like find
extension SequenceType where Generator.Element: IntegerArithmeticType{
    public func canFind(value: Generator.Element) -> Bool{
        for (i,v) in self.enumerate(){
            print("(\(i), \(v))")
            if v == value{
                return true
            }
        }
        return false
    }
}

extension SequenceType where Generator.Element:StringLiteralConvertible{
    public func largestString() -> String{
        var s = ""
        for (_,v) in self.enumerate(){
            if let temp = v as? String where temp.characters.count > s.characters.count{
                s = temp
            }
        }
        return s
    }
}