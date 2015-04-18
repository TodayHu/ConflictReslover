//
//  InterfaceController.swift
//  ConflictReslover WatchKit Extension
//
//  Created by Nick Zhu on 15/4/18.
//  Copyright (c) 2015年 Nick Zhu. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var actionImage: WKInterfaceImage!
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    @IBAction func playTapped() {
        actionImage.setImageNamed("action")
        actionImage.startAnimatingWithImagesInRange(
            NSRange(location: 0, length: 3),
            duration: 0.3,
            repeatCount: 3)
        
        delay(0.9) {
            var imageName = arc4random_uniform(3)
            self.actionImage.setImageNamed("action\(imageName)")
        }
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
