//
//  ReplayKitPreviewViewController.swift
//  SystemPlayground
//
//  Created by Anoop tomar on 12/22/15.
//  Copyright © 2015 Anoop tomar. All rights reserved.
//

import UIKit
import ReplayKit

class ReplayKitPreviewViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    
    var counter = 0
    var timer:NSTimer?
    let record = RPScreenRecorder.sharedRecorder()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didPressRecording(sender: UIButton){
        
        self.startButton.enabled = true
        self.stopButton.enabled = false
        guard record.available else{
            print("can't record the screen")
            return
        }
        record.delegate = self
        record.startRecordingWithMicrophoneEnabled(true) { (error:NSError?) -> Void in
            guard error == nil else{
                if error!.code == RPRecordingErrorCode.UserDeclined.rawValue{
                    print("user declined app recording request")
                }else if error!.code == RPRecordingErrorCode.InsufficientStorage.rawValue{
                    print("Not enought storage to save recording")
                }else{
                    print("Error: \(error!)")
                }
                return
            }
            
            print("Started recording")
            self.startButton.enabled = false
            self.stopButton.enabled = true
            self.timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "incrementCounter", userInfo: nil, repeats: true)
        }
    }
    
    func incrementCounter(){
        counter++
        self.countLabel.text = "\(counter)"
    }
    
    @IBAction func didPressStopRecording(sender: UIButton){
        record.stopRecordingWithHandler { (controller: RPPreviewViewController?, error: NSError?) -> Void in
            guard let ctrl = controller where error == nil else{
                self.startButton.enabled = true
                self.stopButton.enabled = false
                print("Failed to stop")
                return
            }
            
            ctrl.previewControllerDelegate = self
            self.presentViewController(ctrl, animated: true, completion: nil)
            self.timer?.invalidate()
        }
    }

}

extension ReplayKitPreviewViewController: RPScreenRecorderDelegate, RPPreviewViewControllerDelegate{
    func previewControllerDidFinish(previewController: RPPreviewViewController) {
        print("Finished in preview")
        dismissViewControllerAnimated(true, completion: nil)
        startButton.enabled = true
        stopButton.enabled = false
    }
    
    func previewController(previewController: RPPreviewViewController, didFinishWithActivityTypes activityTypes: Set<String>) {
        print("Preview finished with activities \(activityTypes)")
    }
    
    func screenRecorderDidChangeAvailability(screenRecorder: RPScreenRecorder) {
        print("Screen recorder's availability changed")
    }
    func screenRecorder(screenRecorder: RPScreenRecorder, didStopRecordingWithError error: NSError, previewViewController: RPPreviewViewController?) {
        print("screen recording finished")
    }
}
