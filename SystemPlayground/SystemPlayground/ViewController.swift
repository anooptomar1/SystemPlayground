//
//  ViewController.swift
//  SystemPlayground
//
//  Created by Anoop tomar on 12/12/15.
//  Copyright © 2015 Anoop tomar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NSURLSessionDownloadDelegate {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var sampleImage: UIImageView!
    @IBOutlet weak var progress: UIProgressView!
    
    var serialQueue: NSOperationQueue?
    var mainQueue: NSOperationQueue?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageLabel.font = UIFont(name: "Chalkduster", size: 24)
        messageLabel.textColor = UIColor.whiteColor()
        
        UIView.animateWithDuration(5) { () -> Void in
            self.messageLabel.center.y += 300
        }

        //equalityCheck()
        //protocolExtensionTest()
        //perfTester()
        //memePoster()
       // guardExampleTest()
       // errorHandlingExample()
      // ackgroundDownload()
       // operationQueueExample()
    }
    
    func equalityCheck(){
        let c = car()
        let m = motorcycle()
        let c1 = car()
        if c == c1{
            print("\(c.name)")
        }
        if c == m{
            print("not gonna happen")
        }else{
            print("\(c.name) != \(m.name)")
        }
    }
    
    func protocolExtensionTest(){
        
        print(["one", "Two", "nine", "Four", "ten"].largestString())
        
        if [1,2,3,4,5].canFind(6){
            print("found")
        }else{
            print("bummer")
        }
    }
    
    func perfTester(){
        PerfCounter.classPerformance()
        PerfCounter.structPerformance()
    }
    
    func memePoster(){
        sampleImage.image = DeferTest.overlayText(UIImage(named: "IMG_0055")!, text: "10")
    }
    
    func guardExampleTest(){
        
        let p = Person()
        p.firstName = "Yo"
        p.lastName = "Yo"
        if let name = p.fullNameGuard(){
            print("\(name) yo!")
        }else{
            print("hola!")
        }
        
        GuardTest.data = "data here".dataUsingEncoding(NSUTF8StringEncoding)
        if let data = GuardTest.stringForData(){
            print("there is data \n \(data)")
        }else{
            print("no data")
        }
    }
    
    func errorHandlingExample(){
        let person = Person()
        
        person.firstName = "Ho Ho Ho"
        person.lastName = "Santa?"
        
        do{
            let name = try person.fullName()
            print(name)
        }catch let err as Person.PersonError{
            print(err)
        }catch let err as NSException{
            print(err)
        }catch{
            print(error)
        }
    }
    
    func backgroundDownload(){
        let configuration = NSURLSessionConfiguration.backgroundSessionConfigurationWithIdentifier("fileDownload")
        configuration.sessionSendsLaunchEvents = true
        configuration.discretionary = true
        
        let session = NSURLSession(configuration: configuration, delegate: self, delegateQueue: NSOperationQueue())
        let task = session.downloadTaskWithURL(NSURL(string: "http://www.brainloaf.com/introduction-to-ios.mp4")!)
        task.resume()
    }
    
    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didFinishDownloadingToURL location: NSURL) {
        let fileManager = NSFileManager()
        let destination = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).first?.stringByAppendingString("/introduction.mp4") as String!
        do{
            try fileManager.moveItemAtURL(location, toURL: NSURL(fileURLWithPath: destination))
            print("file copied at \(destination)")
        }catch{
            print("Error saving file")
        }
    }
    
    func URLSession(session: NSURLSession, task: NSURLSessionTask, didCompleteWithError error: NSError?) {
        if error == nil{
            print("Download finished")
        }else{
            print("Download failed with error \(error!.localizedDescription)")
        }
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        if let complete = appDelegate.completionHandler{
            complete()
            appDelegate.completionHandler = nil
        }
    }
    func operationQueueExample(){
        mainQueue = NSOperationQueue.mainQueue()
        serialQueue = NSOperationQueue()
        serialQueue?.maxConcurrentOperationCount = 1
        
        serialQueue!.addOperationWithBlock { () -> Void in
            self.progress.setProgress(0.0, animated: false)
        }
        
        for i in 1...1000000{
            if i % 1000 == 0{
                self.mainQueue?.addOperationWithBlock({ () -> Void in
                    let progressDone = Float(i/1000000)
                    self.progress.setProgress(progressDone, animated: true)
                })
            }
        }
    }
    
    
    
    func downloadImageFromInternet(){
        let url = NSURL(string: "https://www.bing.com/az/hprichbg/rb/ZionvilleXmasTrees_EN-US7127087472_1920x1080.jpg")!
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url) { (imageData: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            guard error == nil else{
                return
            }
            let image = UIImage(data: imageData!)!
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.sampleImage.image = image
            })
        }
        task.resume()
    }
    
    func gcd_example(){
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) { () -> Void in
            self.downloadImageFromInternet()
        }
    }

    func longTask(){
        sleep(3)
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            self.messageLabel.text = "Updated with new"
        }
    }
    
    func tapped(sender: UIButton){
        print("Tapped")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func unusedCode(){
        //
        //        let instance = MyThread()
        //        NSThread.detachNewThreadSelector("threadMethod:", toTarget: instance, withObject: nil)
        //
        //        let thread = NSThread(target: instance, selector:"threadMethod:", object: nil)
        //        thread.stackSize = 16000
        //        thread.threadPriority = 0.75
        //        thread.start()
        
        //        let textfield = UITextField()
        //        textfield.placeholder = "Enter your name"
        //        textfield.borderStyle = UITextBorderStyle.RoundedRect
        //        textfield.translatesAutoresizingMaskIntoConstraints = false
        //        view.addSubview(textfield)
        //
        //        let button = UIButton(type: UIButtonType.System)
        //        button.translatesAutoresizingMaskIntoConstraints = false
        //        button.setTitle("Tap Me!", forState: UIControlState.Normal)
        //
        //        button.addTarget(self, action: "tapped:", forControlEvents: UIControlEvents.TouchUpInside)
        //        view.addSubview(button)
        //
        //        let topGuide = self.topLayoutGuide
        //
        //        let views = ["textfield":textfield, "button":button, "topGuide":topGuide] as [String: AnyObject]
        //
        //        let textfieldHeight:Array = NSLayoutConstraint.constraintsWithVisualFormat("V:[textfield(30)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        //
        //        let verticalPosition: Array = NSLayoutConstraint.constraintsWithVisualFormat("V:[topGuide]-10-[textfield]-[button(34)]-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        //
        //        let textfieldHorizontal: Array = NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[textfield]-10-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        //
        //        let buttonHorizontal: Array = NSLayoutConstraint.constraintsWithVisualFormat("H:|-[button(75)]-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views)
        //        
        //        view.addConstraints(textfieldHeight + verticalPosition + textfieldHorizontal + buttonHorizontal)
        
        //  let amount = "90.00"
        //  let amount2 = 9
        //  let decomposedMark = "c\u{20DD}"
        //messageLabel.text = "Hola! \(amount2.toString()) length: \(amount.length()) \(decomposedMark) \(decomposedMark.length())"
        //  messageLabel.text = "Sky is red. Red is water".replace("red", to: "blue")
        //let message = "Today is Thursday"
        
        //messageLabel.text = message.subString(9, length: 8)
        //let date = NSDate.from(year: 2015, month: 12, day: 17)
        //messageLabel.text = "\(NSDate.from("12/15/2015", format: "MM/dd/yyyy"))"
        //messageLabel.text = date.toString("MM/dd/yyyy")

    }

}

