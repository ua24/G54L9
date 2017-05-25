//
//  AddTaskVC.swift
//  G54L9
//
//  Created by Ivan Vasilevich on 5/25/17.
//  Copyright © 2017 Smoosh Labs. All rights reserved.
//

import UIKit
import Parse

class AddTaskVC: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true) {
            print("add new task dismissed")
        }
    }
    
    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        if textView.text.characters.count < 5 {
            return
        }
        let task = PFObject(className: "Task")
        task["descript"] = textView.text!
        task["user"] = PFUser.current()!
        
        do {
            try task.save()
        }
        catch let error {
            print(error)
            showAlertWithErrorText(error.localizedDescription)
            return
        }
        cancelPressed(sender)
        
    }
    
    func showAlertWithErrorText(_ text: String) {
        print(text)
    }

}
