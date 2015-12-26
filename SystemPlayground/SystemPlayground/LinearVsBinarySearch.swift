//
//  LinearVsBinarySearch.swift
//  SystemPlayground
//
//  Created by Anoop tomar on 12/25/15.
//  Copyright © 2015 Anoop tomar. All rights reserved.
//

import Foundation
class LinearVsBinarySearch {
    private static var arr: [Int]={
        var resultArr: [Int] = []
        for i in 0...10{
            resultArr.append(i)
        }
        return resultArr
    }()
    
     init(){
        
    }
    
    static var iterationCounter = 0
    
    class func linearSearch(n: Int){
        iterationCounter = 0
        for a in arr{
            
            if a == n{
                print("Found \(n)")
                print("\(iterationCounter) iterations")
                return
            }
            iterationCounter++
        }
        print("\(n) was not found")
        
    }
    
    class func binarySearch(n: Int){
        iterationCounter = 0
        binarySearchInternal(n, min: 0, max:  arr.count)
    }
    
    private class func binarySearchInternal(key: Int, min: Int, max: Int){
        if min >= max{
            print("\(key) not found")
            return
        }
        
        iterationCounter++
        
        // compute mid index
        let mid = Int((min + max)/2)
        // find value at mid index
        let midValue = arr[mid]
        // if key is greater then mid index value, new min is current mid index + 1
        if key > midValue{
            binarySearchInternal(key, min: mid + 1, max: max)
        }
        // if key is less then mid index value, new max is current mid - 1
        else if key < midValue{
            binarySearchInternal(key, min: min, max: mid - 1)
        }
        // else found the number
        else{
            print("\(key) found")
            print("\(iterationCounter) iterations")
        }
    }
}