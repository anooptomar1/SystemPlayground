//
//  MyThread.swift
//  SystemPlayground
//
//  Created by Anoop tomar on 12/18/15.
//  Copyright © 2015 Anoop tomar. All rights reserved.
//

import Foundation

@objc
class MyThread:NSObject{
    func threadMethod(object: AnyObject){
        for i in 1...1000{
            objc_sync_enter(object)
            print("Thread with i: \(i)")
            objc_sync_exit(object)
        }
    }
}