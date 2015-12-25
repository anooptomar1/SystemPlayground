//
//  NotificationText.swift
//  SystemPlayground
//
//  Created by Anoop tomar on 12/21/15.
//  Copyright © 2015 Anoop tomar. All rights reserved.
//

import Foundation
import UIKit

class NotificationText{

    class func registerForNotifications(){
        let enterInfo = UIMutableUserNotificationAction()
        enterInfo.identifier = "enter"
        enterInfo.title = "Enter your name"
        enterInfo.behavior = UIUserNotificationActionBehavior.TextInput
        enterInfo.activationMode = UIUserNotificationActivationMode.Foreground
        
        let cancel = UIMutableUserNotificationAction()
        cancel.identifier = "cancel"
        cancel.title = "Cancel"
        
        let category = UIMutableUserNotificationCategory()
        category.identifier = "texted"
        category.setActions([enterInfo, cancel], forContext: UIUserNotificationActionContext.Default)
        
        let settings = UIUserNotificationSettings(forTypes: UIUserNotificationType.Alert, categories: [category])
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
    }
    
    class func scheduleNotification(){
        let n = UILocalNotification()
        let c = NSCalendar.autoupdatingCurrentCalendar()
        let comp = c.componentsInTimeZone(c.timeZone, fromDate: NSDate())
        comp.second += 3
        let date = c.dateFromComponents(comp)
        n.fireDate = date
        
        n.alertBody = "Please enter your name now"
        n.alertAction = "Enter"
        n.category = "texted"
        UIApplication.sharedApplication().scheduleLocalNotification(n)
    }
    
}