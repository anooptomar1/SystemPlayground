//
//  DateExtensions.swift
//  SystemPlayground
//
//  Created by Anoop tomar on 12/17/15.
//  Copyright © 2015 Anoop tomar. All rights reserved.
//

import Foundation
extension NSDate{
    class func from(year year: Int, month: Int, day: Int) -> NSDate{
        let c = NSDateComponents()
        c.year = year
        c.month = month
        c.day = day
        let gregorian = NSCalendar(identifier: NSCalendarIdentifierGregorian)
        let date = gregorian?.dateFromComponents(c)
        return date!
    }
    
    class func from(string: String, format: String) -> NSDate{
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeZone = NSTimeZone.defaultTimeZone()
        dateFormatter.dateFormat = format
        return dateFormatter.dateFromString(string)!
    }
    
    func toString(format: String) -> String{
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.stringFromDate(self)
    }
}