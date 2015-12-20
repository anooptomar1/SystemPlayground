//
//  DeferTest.swift
//  SystemPlayground
//
//  Created by Anoop tomar on 12/19/15.
//  Copyright © 2015 Anoop tomar. All rights reserved.
//

import Foundation
import UIKit
class DeferTest {
    class func overlayText(image: UIImage, text: String) -> UIImage{
        
        // defer is always called at the end of the method
        // defer is called after the method has returned from the call
        // defer is best for clean up after code
        // defer is also called after the exception so best place to fee up resources
        defer{
            UIGraphicsEndImageContext()
        }
        
        let imageSize = image.size
        let textColor = UIColor.whiteColor().colorWithAlphaComponent(0.1)
        let textFont = UIFont(name: "Chalkduster", size: 100)
        let overlayString = NSString(string: "".stringByPaddingToLength(10000, withString: "10", startingAtIndex: 0))
        let textAttributes = [NSFontAttributeName: textFont!, NSForegroundColorAttributeName: textColor]
        
        UIGraphicsBeginImageContext(imageSize)
        image.drawInRect(CGRectMake(0, 0, imageSize.width, imageSize.height))
        overlayString.drawInRect(CGRectMake(0, 0, imageSize.width, imageSize.height), withAttributes: textAttributes)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}