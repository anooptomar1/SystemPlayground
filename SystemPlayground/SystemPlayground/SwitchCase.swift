//
//  SwitchCase.swift
//  SystemPlayground
//
//  Created by Anoop tomar on 12/20/15.
//  Copyright © 2015 Anoop tomar. All rights reserved.
//

import Foundation
class SwitchCase {
    class func testAge(){
        let age = 30
        
        switch age{
        case 1...10: fallthrough
        case 20...30:
            print("Age is from 10 to 30")
        default:
            print(age)
        }
    }
}