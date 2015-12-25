//
//  ConditionalCheck.swift
//  SystemPlayground
//
//  Created by Anoop tomar on 12/20/15.
//  Copyright © 2015 Anoop tomar. All rights reserved.
//

import Foundation
class ConditionalCheck {
    
    static let divisibleByEight = {(n:Int) -> Bool in return n % 8 == 0}
    
    class func checkInClosure(){
        
        for i in 0...100 where divisibleByEight(i){
            print("\(i)")
        }
    }
    
    class func checkBeforeEnteringLoop(){
        for i in 0...10 where i % 2 == 0{
            print(i)
        }
    }
    
    class func checkBeforeEnterKVLoop(){
        let dictionary = ["key1": 1, "key2": 2, "key3": 3, "key4": 4]
        for (k, v) in dictionary where v % 2 == 0{
            print("(\(k), \(v))")
        }
    }
}