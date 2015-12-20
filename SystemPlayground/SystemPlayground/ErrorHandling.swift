//
//  ErrorHandling.swift
//  SystemPlayground
//
//  Created by Anoop tomar on 12/18/15.
//  Copyright © 2015 Anoop tomar. All rights reserved.
//

import Foundation
class Person{
    var firstName: String?
    var lastName: String?
    
    enum PersonError: ErrorType{
        case EmptyFirstName
        case EmptyLastName
    }
    
    func fullName() throws -> String{
        if firstName == nil || firstName?.characters.count == 0{
            throw PersonError.EmptyFirstName
        }
        if lastName == nil || lastName?.characters.count == 0{
            throw PersonError.EmptyLastName
        }
        return "\(firstName!) \(lastName!)"
    }
    
    func fullNameGuard() -> String?{
    
        guard let fname = firstName, let lname = lastName where fname.characters.count > 0 && lname.characters.count > 0 else{
            return nil
        }
        return "\(fname) \(lname)"
    }
}