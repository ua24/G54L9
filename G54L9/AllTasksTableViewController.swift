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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let query = PFQuery(className: "Task")
        let result = try! query.findObjects()
//        print(result.count)
//        if let descriptionOfTask = result.first!["descript"] as? String {
//            print(descriptionOfTask)
//        }
//        let numbers = [1, 2, 3]
//        print(numbers)
//        let stringNumbers = numbers.map { (number) -> String in
//            return number.description
//        }
//        print(stringNumbers)
        tasks = result.map({ (obj) -> String in
            return obj["descript"] as? String ?? "no task descrypt"
        })
        
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
