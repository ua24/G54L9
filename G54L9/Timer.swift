//
//  Timer.swift
//  G54L9
//
//  Created by Ivan Vasilevich on 5/23/17.
//  Copyright © 2017 Smoosh Labs. All rights reserved.
//

import UIKit

class MyTimer: NSObject {

    func startTick(interval: TimeInterval) {
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(foo(timer:)), userInfo: nil, repeats: false)
    }
    
    @objc private func foo(timer: Timer) {
//        timer.invalidate()
        print("tick")
    }
}
