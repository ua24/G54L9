//
//  ViewController.swift
//  G54L9
//
//  Created by Ivan Vasilevich on 5/23/17.
//  Copyright © 2017 Smoosh Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let myTimer = MyTimer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(bar(notificaton:)),
                                               name: MyTimer.kTickDidRecognizedNotification,
                                               object: myTimer)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        myTimer.startTick(interval: 3)
    }
    
    func bar(notificaton: Notification) {
        print("notificaton recieved")
    }

}

