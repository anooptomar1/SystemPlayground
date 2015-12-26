//
//  SwiftLL.swift
//  SystemPlayground
//
//  Created by Anoop tomar on 12/26/15.
//  Copyright © 2015 Anoop tomar. All rights reserved.
//

import Foundation
class LLNode<T> {
    var key: T!
    var nextItem: LLNode?
    var previousItem: LLNode?
}

// make T as equatable so its type must follow and implement == and !=
class SwiftLL<T: Equatable> {
    
    // computed property to get list count
    var count: Int{
        // if head is nil. no element return 0
        if head.key == nil{
            return 0
        }else{
            // assign head to current
            var current: LLNode = head
            // start counter
            var x = 1
            while current.nextItem != nil{
                // assign next to current and loop through all the elements
                current = current.nextItem!
                // increment counter
                x++
            }
            return x
        }
    }
    
    // define head pointer
    private var head: LLNode<T> = LLNode<T>()
    
    func addElement(newKey: T){
        // if head.key is nil meaning first element
        if head.key == nil{
            // assign new key to the head and return from here
            head.key = newKey
            return
        }
        
        // if head is not nil then assign head to a new variable
        var current: LLNode? = head
        // loop until current variable is not nil
        while current != nil{
            // if the next item is nil, it must be the last element so insert new node here
            if current?.nextItem == nil{
                let newChild = LLNode<T>()
                newChild.key = newKey
                // assign current as new node's previous
                newChild.previousItem = current
                // assign new node as current's next
                current!.nextItem = newChild
                return
            }
            else{
                // if next node item is not null assign it to current
                current = current?.nextItem
            }
        }
    }
    
    func removeAtIndex(index: Int){
        // no element if index is less then 0, greater then self count or head.key is nil
        if index < 0 || index > self.count || head.key == nil{
            print("Invalid index")
            return
        }
        
        if index == 0{
            let current = head.nextItem
            head = current!
            return
        }
        
        var current:LLNode<T>? = head.nextItem
        var trailer:LLNode<T>?
        var internalIndex = 0
        
        while current != nil{
            if index == internalIndex{
                trailer?.nextItem = current?.nextItem
                current = nil
                return
            }
            trailer = current
            current = current?.nextItem
            internalIndex++
        }
    }
    
    func printList() -> [T]?{
        // return if head is nil, no elements in list yet
        if head.key == nil{
            return nil
        }
        // create empty array of type T
        var result: [T] = []
        // head.key is not nil meaning atleast on node is there
        var current: LLNode? = head
        // loop through the end of the list and assign values to array of T
        while current != nil{
            result.append(current!.key)
            current = current?.nextItem
        }
        return result
    }
}