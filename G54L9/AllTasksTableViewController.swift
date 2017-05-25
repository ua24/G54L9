//
//  AllTasksTableViewController.swift
//  G54L9
//
//  Created by Ivan Vasilevich on 5/23/17.
//  Copyright © 2017 Smoosh Labs. All rights reserved.
//

import UIKit
import Parse

class AllTasksTableViewController: UITableViewController {

    var tasks = [String]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        reloadTasks()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if PFUser.current() == nil {
            performSegue(withIdentifier: "showLogin", sender: self)
        }
    }


    func reloadTasks() {
        let query = PFQuery(className: "Task")
//        let result = try! query.findObjects()
//        query.whereKey("user", equalTo: PFUser.current()!)
        query.whereKey("createdAt", lessThan: Date.init(timeIntervalSinceNow: -3360))
        query.fromPin()
//        query.order(byAscending: "createdAt")
//        query.limit = 200
//        query.skip = 200
        query.findObjectsInBackground { (objects, error) in
            if let result = objects {
                try! PFObject.pinAll(result)
                self.tasks = result.map({ (obj) -> String in
                     var str = obj["descript"] as? String ?? "no task descrypt"
                    
//                    print(obj["user"] as? PFObject)
                    if (obj["user"] as? PFObject ?? PFObject(className: "Task")).objectId == PFUser.current()!.objectId! {
                        str = "#my:" + str
                    }
                    return str
                })
                self.tableView.reloadData()
            }
        }
        
        
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        cell.textLabel?.text = tasks[indexPath.row]
        // Configure the cell...

        return cell
    }
 

}
