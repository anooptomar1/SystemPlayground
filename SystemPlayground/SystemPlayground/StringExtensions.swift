//
//  StringExtensions.swift
//  SystemPlayground
//
//  Created by Anoop tomar on 12/16/15.
//  Copyright © 2015 Anoop tomar. All rights reserved.
//

import Foundation
extension String{
    func toDouble() -> Double?{
        let formatter = NSNumberFormatter()
        return formatter.numberFromString(self)?.doubleValue
    }
    
    func toFloat() -> Float?{
        let formatter = NSNumberFormatter()
        return formatter.numberFromString(self)?.floatValue
    }
    
    func length() -> Int{
        return self.characters.count
    }
    
    func replace(from: String, to: String) -> String{
        return self.stringByReplacingOccurrencesOfString(from, withString: to, options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil)
    }
    
    func subString(startIndex: Int, length: Int) -> String?{
        let maxLength = self.length() - 1
        if startIndex + length - 1 > maxLength{
            return nil
        }
        let start = self.startIndex.advancedBy(startIndex)
        let end = self.startIndex.advancedBy(startIndex + length - 1)
        return self[start...end]
    }
}