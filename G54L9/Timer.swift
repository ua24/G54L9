//
//  Timer.swift
//  G54L9
//
//  Created by Ivan Vasilevich on 5/23/17.
//  Copyright © 2017 Smoosh Labs. All rights reserved.
//

import UIKit

class MyTimer: NSObject {
    
    static let kTickDidRecognizedNotification = Notification.Name(rawValue: "kTickDidRecognizedNotification")

    func startTick(interval: TimeInterval) {
        Timer.scheduledTimer(timeInterval: interval,
                             target: self,
                             selector: #selector(foo(timer:)),
                             userInfo: nil, repeats: false)
    }
    
    private var tickCount = 0
    
    @objc private func foo(timer: Timer) {
//        timer.invalidate()
//        print("tick")
        tickCount += 1
        NotificationCenter.default.post(name: MyTimer.kTickDidRecognizedNotification,
                                        object: self,
                                        userInfo: ["tickCount": tickCount])
    }
}
