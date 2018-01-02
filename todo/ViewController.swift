//
//  ViewController.swift
//  todo
//
//  Created by isha on 28/12/17.
//  Copyright © 2017 isha. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var taskTable: UITableView!
    var retrievedTasks = tasks
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskTable.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.taskTable.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return retrievedTasks.count
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = taskTable.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! tableCells
        let item = retrievedTasks[indexPath.row]
        cell.titleLabel?.text = item["taskTitle"] as? String
        cell.dueDateLabel?.text = item["dueDate"] as? String
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var item = retrievedTasks[indexPath.row]
        if taskTable.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark {
            taskTable.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
            item["status"] = false
        } else {
            taskTable.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
            item["status"] = true
        }
    }
    
    @IBAction func addButton(_ sender: Any) {
        performSegue(withIdentifier: "addTask", sender: sender)
    }
    
    


}

