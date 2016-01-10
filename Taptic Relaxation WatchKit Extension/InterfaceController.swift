//
//  InterfaceController.swift
//  Taptic Relaxation WatchKit Extension
//
//  Created by Shawn Taylor on 1/9/16.
//  Copyright © 2016 Proximity Viz LLC. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var startStopButton: WKInterfaceButton!
    var running = false
    var countdown: NSTimer!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func startStopPressed() {
        
        if running {
            
            // stop
            running = false
            countdown.invalidate()
            countdown = nil
            startStopButton.setTitle("Start")
            
        } else {
            
            // start
            running = true
            countdown = NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: Selector("complete"), userInfo: nil, repeats: true)
            startStopButton.setTitle("Stop")
            
        }
        
    }
    
    func complete() {
        
        print("Done!")
        WKInterfaceDevice.currentDevice().playHaptic(WKHapticType.Start)
        
    }

}
