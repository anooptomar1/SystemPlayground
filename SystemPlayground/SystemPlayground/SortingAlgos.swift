//
//  SortingAlgos.swift
//  SystemPlayground
//
//  Created by Anoop tomar on 12/25/15.
//  Copyright © 2015 Anoop tomar. All rights reserved.
//

import Foundation
class SortingAlgos {
    class func insertionSort(){
        var arr: [Int] = []
        for _ in 0...100{
            arr.append(Int(arc4random_uniform(10000)))
        }
        
        print("Unsorted array: \(arr)")
        
        
        for i in 1..<arr.count{
            // get ith item as key to compare
            let key = arr[i]
           // print("i = \(i) || key = \(key)")
           // print("array at \(i): \(arr)")
            // j starts with i as upper bound
            var j = i
            // reverse loop j until it reaches 0 and compare key with previous element of j
            while j > 0 && arr[j-1] > key{
             //   print("j = \(j) || arr[j-1] = \(arr[j-1]) || arr[j] = \(arr[j])")
                arr[j] = arr[j-1]
             //   print("j = \(j) || arr[j-1] = \(arr[j-1]) || arr[j] = \(arr[j])")
             //   print("array after j: \(j): \(arr)")
                j--
            }
            arr[j] = key
            //print("array after \(i): \(arr)")
            //print("==============")
        }
        
        print("Sorted array: \(arr)")
    }
    
    class func bubbleSort(){
        var arr: [Int] = []
        for _ in 0..<10{
            arr.append(Int(arc4random_uniform(100)))
        }
        
        print("Unsorted array: \(arr)")
        
        var z,passes,key:Int
        
        for x in 0..<arr.count{
            passes  = (arr.count - 1) - x
            print("passes = \(passes) || x = \(x)")
            for y in 0..<passes{

                key = arr[y]
                print("key: \(key) || y: \(y)")
                if key > arr[y+1]{
                    print("arr(y+1): \(arr[y + 1]) || arr[y]: \(arr[y])")
                    z = arr[y + 1]
                    arr[y + 1] = key
                    arr[y] = z
                }
                print("=============================")
            }
        }
        
        print("Sorted array: \(arr)")
    }
}