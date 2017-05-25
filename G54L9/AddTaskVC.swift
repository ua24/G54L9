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
        
        task.saveInBackground { (success, error) in
            if success {
                self.cancelPressed(sender)
            }
            else {
                self.showAlertWithErrorText((error?.localizedDescription)!)
            }
        }
    }
    
    func showAlertWithErrorText(_ text: String) {
        let alert = UIAlertController(title: "Error occured", message: "It's not you fault.\n" + text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Settings", style: .default, handler: { (act) in
            UIApplication.shared.open(URL.init(string: UIApplicationOpenSettingsURLString)!, options: ["": ""], completionHandler: nil)
        }))
        present(alert, animated: true, completion: nil)
    }

    @IBAction func addPhoto(_ sender: UIBarButtonItem) {
        let picker = UIImagePickerController()
        picker.delegate = self
        present(picker, animated: true, completion: nil)
        
    }
}

extension AddTaskVC: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        let img = info[UIImagePickerControllerOriginalImage] as! UIImage
        view.backgroundColor = UIColor.init(patternImage: img)
        print(info)
        
    }
}
