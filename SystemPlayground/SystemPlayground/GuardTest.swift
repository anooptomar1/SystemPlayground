//
//  GuardTest.swift
//  SystemPlayground
//
//  Created by Anoop tomar on 12/18/15.
//  Copyright © 2015 Anoop tomar. All rights reserved.
//

import Foundation
class GuardTest {
    static var data: NSData?
    
    class func stringForData() -> String?{
        
        guard let d = data, let str = String(data: d, encoding: NSUTF8StringEncoding) where d.length > 0 else{
            return nil
        }
        
        return String(str)
    }
    
    
}