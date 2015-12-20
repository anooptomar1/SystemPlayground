//
//  APIAvailableTest.swift
//  SystemPlayground
//
//  Created by Anoop tomar on 12/19/15.
//  Copyright © 2015 Anoop tomar. All rights reserved.
//

import Foundation
class APIAvailableTest {
    
    enum APIAvailableError: ErrorType{
        case EmptyData
    }
    
    
    func bytesFromData(data: NSData) throws -> [UInt8]{
        
        guard data.length > 0 else{
            throw APIAvailableError.EmptyData
        }
        
        var buffer = [UInt8](count: data.length, repeatedValue: 0)
        // to see this in effect reduce deployment target to 7.0 or something
        if #available(iOS 8.0, *){
            data.getBytes(&buffer, length: data.length)
        }else{
            data.getBytes(&buffer)
        }
        return buffer
    }
}