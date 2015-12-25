//
//  AppDelegate.swift
//  SystemPlayground
//
//  Created by Anoop tomar on 12/12/15.
//  Copyright © 2015 Anoop tomar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var completionHandler: (()->Void)?
    
    var window: UIWindow?
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        NotificationText.registerForNotifications()
//        self.window = UIWindow()
//        let vc = UIViewController()
        //vc.view = addSubViewsAndSuperViews(vc.view)
        //vc.view = boundsAndCenter(vc.view)
        //vc.view = transformationTest(vc.view)
        //vc.view = autoSizing(vc.view)
        //vc.view = autolayoutView(vc.view)
//        vc.view = autoLayoutAnchors(vc.view)
//        self.window?.rootViewController = vc
//        self.window?.backgroundColor = UIColor.whiteColor()
//        self.window?.makeKeyAndVisible()
        return true
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        NotificationText.scheduleNotification()
    }
    
    func application(application: UIApplication, handleActionWithIdentifier identifier: String?, forLocalNotification notification: UILocalNotification, withResponseInfo responseInfo: [NSObject : AnyObject], completionHandler: () -> Void) {
        if let text = responseInfo[UIUserNotificationActionResponseTypedTextKey] as? String{
            print(text)
        }
    }
    
    func application(application: UIApplication, handleEventsForBackgroundURLSession identifier: String, completionHandler: () -> Void) {
        self.completionHandler = completionHandler
    }
    
    
    func autoLayoutAnchors(v: UIView) -> UIView{
        let v1 = UIView(frame: CGRectMake(100, 111, 132, 194))
        v1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
        let v2 = UIView()
        v2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
        let v3 = UIView()
        v3.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        v.addSubview(v1)
        v1.addSubview(v2)
        v2.addSubview(v3)
        v2.translatesAutoresizingMaskIntoConstraints = false
        v3.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activateConstraints([
                v2.leadingAnchor.constraintEqualToAnchor(v1.leadingAnchor),
                v2.trailingAnchor.constraintEqualToAnchor(v1.trailingAnchor),
                v2.topAnchor.constraintEqualToAnchor(v1.topAnchor),
                v2.heightAnchor.constraintEqualToConstant(10),
                v3.widthAnchor.constraintEqualToConstant(20),
                v3.heightAnchor.constraintEqualToConstant(20),
                v3.trailingAnchor.constraintEqualToAnchor(v1.trailingAnchor),
                v3.bottomAnchor.constraintEqualToAnchor(v1.bottomAnchor)
            ])
        return v
    }
    
    func autolayoutView(v: UIView)-> UIView{
        let v1 = UIView(frame: CGRectMake(100, 111, 132, 194))
        v1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
        let v2 = UIView()
        v2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
        let v3 = UIView()
        v3.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        v.addSubview(v1)
        v1.addSubview(v2)
        v2.addSubview(v3)
        v2.translatesAutoresizingMaskIntoConstraints = false
        v3.translatesAutoresizingMaskIntoConstraints = false
        
        v1.addConstraint(NSLayoutConstraint(item: v2, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: v1, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 0))
        v1.addConstraint(NSLayoutConstraint(item: v2, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: v1, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 0))
        v1.addConstraint(NSLayoutConstraint(item: v2, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: v1, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0))
        v2.addConstraint(NSLayoutConstraint(item: v2, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 10))
        v3.addConstraint(NSLayoutConstraint(item: v3, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 20))
        v3.addConstraint(NSLayoutConstraint(item: v3, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 20))
        v1.addConstraint(NSLayoutConstraint(item: v3, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: v1, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 0))
        v1.addConstraint(NSLayoutConstraint(item: v3, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: v1, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0))
        return v
    }
    
    func autoSizing(v: UIView)->UIView{
        let v1 = UIView(frame: CGRectMake(100,111,132,194))
        v1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
        let v2 = UIView(frame: CGRectMake(0,0,132,10))
        v2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
        let v3 = UIView(frame: CGRectMake(v1.bounds.width - 20, v1.bounds.height - 20, 20, 20))
        v3.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        v.addSubview(v1)
        v1.addSubview(v2)
        v1.addSubview(v3)
        
        v2.autoresizingMask = UIViewAutoresizing.FlexibleWidth
        v3.autoresizingMask = [UIViewAutoresizing.FlexibleTopMargin, UIViewAutoresizing.FlexibleLeftMargin]
        
        UIView.animateWithDuration(5) { () -> Void in
            v1.bounds.size.width += 40
            v1.bounds.size.height -= 50
        }
        
        UIView.animateWithDuration(5) { () -> Void in
            v1.frame = v.bounds.insetBy(dx: 10, dy: 10)
            v1.autoresizingMask = [UIViewAutoresizing.FlexibleHeight, UIViewAutoresizing.FlexibleWidth]
        }
        return v
    }
    
    func transformationTest(v: UIView) -> UIView{
        let v1 = UIView(frame: CGRectMake(113, 111, 132, 194))
        v1.backgroundColor = UIColor.lightGrayColor()
        let v2 = UIView(frame: v1.bounds.insetBy(dx: 10, dy: 10))
        v2.backgroundColor = UIColor.orangeColor()
        v.addSubview(v1)
        v1.addSubview(v2)
        v1.transform = CGAffineTransformMakeRotation(45 * CGFloat(M_PI)/180.0)
        return v
    }
    
    func addSubViewsAndSuperViews(vc: UIView) -> UIView{
        let v1 = UIView(frame: CGRectMake(113,111,132,194))
        v1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
        let v2 = UIView(frame: CGRectMake(41, 56, 132, 194))
        v2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
        let v3 = UIView(frame: CGRectMake(43,197,160,230))
        v3.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        vc.addSubview(v1)
        v1.addSubview(v2)
        //v1.clipsToBounds = true
        vc.addSubview(v3)
        return vc
    }
    
    func boundsAndCenter(vc: UIView) -> UIView{
        let v1 = UIView(frame: CGRectMake(113,111,132,194))
        v1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
        let v2 = UIView(frame: v1.bounds.insetBy(dx: 10, dy: 10))
        v2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
        v1.addSubview(v2)
        vc.addSubview(v1)
        
        v1.center = vc.center
        print(v1.superview?.convertRect(v1.frame, toCoordinateSpace: UIScreen.mainScreen().coordinateSpace))
//        v1.frame = CGRectMake(200, 200, 100, 100)
//       
//        v2.bounds.size.height += 20
//        v2.bounds.size.width += 20
//        v1.bounds.origin.x += 10
//        v1.bounds.origin.y += 10
        return vc
    }
}

