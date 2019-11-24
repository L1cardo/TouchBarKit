//
//  AppDelegate.swift
//  TouchBarKit
//
//  Created by Licardo on 2019/11/23.
//  Copyright © 2019 Licardo. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let displays = ["😉", "🤡", "👨‍⚕️‍" ,"🐶" ,"Hello!"]
    var touchBarButton: NSButton?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        touchBar()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func touchBar() {
        let display = displays[0]
        DFRSystemModalShowsCloseBoxWhenFrontMost(true)

        let touchBarIdentifier = NSTouchBarItem.Identifier(rawValue: "TouchBar")
        let touchBarItem = NSCustomTouchBarItem.init(identifier: touchBarIdentifier)
        touchBarButton = NSButton(title: display, target: nil, action: #selector(switchDisplay))
        touchBarItem.view = touchBarButton!
        NSTouchBarItem.addSystemTrayItem(touchBarItem)
        DFRElementSetControlStripPresenceForIdentifier(touchBarIdentifier, true)
    }
    
    @objc func switchDisplay() {
        touchBarButton?.title = displays[.random(in: 0...4)]
    }
}

