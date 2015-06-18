//
//  AppDelegate.swift
//  LostMyDoorbellOSX
//
//  Created by Simon Fry on 18/06/2015.
//  Copyright (c) 2015 LostMy.Name. All rights reserved.
//

import Cocoa
import Alamofire

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var window: NSWindow!
    
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-2)

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        if let button = statusItem.button {
            button.image = NSImage(named: "StatusBarButtonImage")
            button.action = Selector("openDoor")
        }
    }
    
    func openDoor() {
        Alamofire.request(.POST, "https://lostmydoorbell.herokuapp.com/", parameters: [
            "token": slackToken(),
            "user_name": "Simonf Test"
            ])
    }
    
    func slackToken() -> AnyObject {
        let path = NSBundle.mainBundle().pathForResource("settings", ofType: "plist")
        let settings = NSDictionary(contentsOfFile: path!)!
        
        return settings["SlackToken"]!
    }
}

