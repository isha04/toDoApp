//
//  ViewController.swift
//  todo
//
//  Created by isha on 28/12/17.
//  Copyright © 2017 isha. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var taskTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        retrieveTasks()
        taskTable.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        retrieveTasks()
        taskTable.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = taskTable.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! tableCells
        let item = tasks[indexPath.row]
        cell.titleLabel?.text = item["taskTitle"] as? String
        cell.dueDateLabel?.text = item["dueDate"] as? String
        if item["status"] as? Bool == true {
           cell.accessoryType = UITableViewCellAccessoryType.checkmark
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.none
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var data = tasks[indexPath.row]
        if taskTable.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark {
            taskTable.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
            data["status"] = false
        } else {
            taskTable.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
            data["status"] = true
        }
        updateTask(newData: data, oldArray: &tasks, index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexpath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            tasks.remove(at: indexpath.row)
            taskTable.reloadData()
        }
        saveTask(inputArray: tasks)
    }
    
    @IBAction func addButton(_ sender: Any) {
        performSegue(withIdentifier: "addTask", sender: sender)
    }

}

