//
//  ContactsFrameWork.swift
//  SystemPlayground
//
//  Created by Anoop tomar on 12/24/15.
//  Copyright © 2015 Anoop tomar. All rights reserved.
//

import Foundation
import Contacts

class ContactsFrameWork {
    
    static var store = CNContactStore()
    
    class func  deleteContact(){
        NSOperationQueue().addOperationWithBlock {[unowned store] () -> Void in
            let predicate = CNContact.predicateForContactsMatchingName("Anoop")
            let fetch = [CNContactEmailAddressesKey]
            
            do{
                let contacts = try store.unifiedContactsMatchingPredicate(predicate, keysToFetch: fetch)
                
                guard contacts.count > 0 else{
                    print("No contract found")
                    return
                }
                
                guard let contact = contacts.first else {
                    return
                }
                
                let req = CNSaveRequest()
                let mutableContact = contact.mutableCopy() as! CNMutableContact
                req.deleteContact(mutableContact)
                
                do {
                    try store.executeSaveRequest(req)
                    print("Deleted Successfully")
                }catch let e{
                    print(e)
                }
                
            }catch let err{
                print(err)
            }
        }
    }
    
    class func updateContact(){
        NSOperationQueue().addOperationWithBlock {[unowned store] () -> Void in
            let predicate = CNContact.predicateForContactsMatchingName("Anoop")
            let fetch = [CNContactEmailAddressesKey]
            
            do{
                let contacts = try store.unifiedContactsMatchingPredicate(predicate, keysToFetch: fetch)
                guard contacts.count > 0 else{
                    print("no contacts found")
                    return
                }
                
                guard let contact = contacts.first else{
                    return
                }
                
                let newEmail = "newEmail@gmail.com"
                for email in contact.emailAddresses{
                    if email.value as! String == newEmail{
                        print("contact has the same email already")
                        return
                    }
                }
                
                let anoop = contact.mutableCopy() as! CNMutableContact
                let emailAddress = CNLabeledValue(label: CNLabelWork, value: newEmail)
                anoop.emailAddresses.append(emailAddress)
                let req = CNSaveRequest()
                req.updateContact(anoop)
                try store.executeSaveRequest(req)
                print("Added the email")
            }catch let err{print(err)}
        }
    }
    
    class func searchContactsWithProfileImage(){
        NSOperationQueue().addOperationWithBlock { [unowned store] () -> Void in
            var fetch = [CNContactImageDataAvailableKey]
            let request = CNContactFetchRequest(keysToFetch: fetch)
            var contacts = [CNContact]()
            do{
                try store.enumerateContactsWithFetchRequest(request, usingBlock: { (contact:CNContact, stop) -> Void in
                    if contact.imageDataAvailable{
                        contacts.append(contact)
                    }
                })
            }catch let err{
                print(err)
            }
            for c in contacts{
                fetch = [CNContactGivenNameKey, CNContactFamilyNameKey]
                do{
                    let contact = try store.unifiedContactWithIdentifier(c.identifier, keysToFetch: fetch)
                    print(contact.givenName)
                    print(contact.familyName)
                }
                catch let err{
                    print(err)
                }
            }
        }
    }
    
    class func searchContactsByFetchRequest(){
        let fetch = [CNContactPhoneNumbersKey, CNContactGivenNameKey, CNContactFamilyNameKey]
        let request = CNContactFetchRequest(keysToFetch: fetch)
        
        do{
            // enumerate all contacts
            try store.enumerateContactsWithFetchRequest(request, usingBlock: { (contact: CNContact, stop) -> Void in
                print("\(contact.givenName)")
                print("\(contact.familyName)")
                if contact.givenName == "David"{
                    // exit enumeration with stop.memory=true
                    stop.memory = true
                }
            })
        }catch let err{
            print(err)
        }
    }
    
    // search for contact by given matching pattern
    class func searchContactByPredicate(){
        let predicate = CNContact.predicateForContactsMatchingName("tomar")
        let toFetch = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey]

        
        
        do{
            let contacts = try store.unifiedContactsMatchingPredicate(predicate, keysToFetch: toFetch)
            for c in contacts{
                print("\(c.givenName)")
                print("\(c.phoneNumbers)")
                print("\(c.identifier)")
            }
        }catch let err{
            print(err)
        }
    }
    
    
    class func createNewContact(){
        switch CNContactStore.authorizationStatusForEntityType(.Contacts){
        
        case .Authorized:
            createNewContactInternal()
        case .NotDetermined:
            store.requestAccessForEntityType(.Contacts, completionHandler: { (success: Bool, error:NSError?) -> Void in
                guard error == nil && success else{
                    return
                }
                self.createNewContactInternal()
            })
        default:
            print("Not handled")
        }
    }
    
    class func createNewContactInternal(){
        let newContact = CNMutableContact()
        newContact.givenName = "Anoop"
        newContact.familyName = "Tomar"
        
        let homePhone = CNLabeledValue(label: CNLabelHome, value: CNPhoneNumber(stringValue: "+1-980-428-2889"))
        let workPhone = CNLabeledValue(label: CNLabelWork, value: CNPhoneNumber(stringValue: "+1-980-428-2889"))
        newContact.phoneNumbers = [homePhone, workPhone]
        
        let homeEmail = CNLabeledValue(label: CNLabelHome, value: "anooptomar@gmail.com")
        let workEmail = CNLabeledValue(label: CNLabelWork, value: "anooptomar@tree.com")
        newContact.emailAddresses = [homeEmail, workEmail]
        
        newContact.jobTitle = "Cheif Executive Officer"
        newContact.organizationName = "Creative, Inc"
        newContact.departmentName = "Executive"
        
        let fbProfile = CNLabeledValue(label: "FaceBook", value: CNSocialProfile(urlString: nil, username: "anooptomar", userIdentifier: nil, service: CNSocialProfileServiceFacebook))
        let twitterProfile = CNLabeledValue(label: "Twitter", value: CNSocialProfile(urlString: nil, username: "anooptomar", userIdentifier: nil, service: CNSocialProfileServiceTwitter))
        newContact.socialProfiles = [fbProfile, twitterProfile]
        
        let skypeAddress = CNLabeledValue(label: "Skype", value: CNInstantMessageAddress(username: "anooptomar", service: CNInstantMessageServiceSkype))
        
        newContact.instantMessageAddresses = [skypeAddress]
        
        newContact.note = "Blah blah blah"
        
        let birthday = NSDateComponents()
        birthday.year = 1980
        birthday.month = 10
        birthday.day = 9
        newContact.birthday = birthday
        
        let anniversaryDate = NSDateComponents()
        anniversaryDate.day = 2
        anniversaryDate.month = 12
        let anniversary = CNLabeledValue(label: "Anniversary", value: anniversaryDate)
        newContact.dates = [anniversary]
        
        let request = CNSaveRequest()
        request.addContact(newContact, toContainerWithIdentifier: nil)
        
        do{
            try store.executeSaveRequest(request)
            print("Saved successfully")
        }catch let err{
            print("Failed to save the contact \(err)")
        }
    }
}