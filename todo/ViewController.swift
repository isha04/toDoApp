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
    
    var retrievedTasks = [[String: Any]]()
    
    
    func retrieveTasks() {
        if let loadedTasks = UserDefaults.standard.array(forKey: "mytasks") as? [[String: Any]] {
            retrievedTasks = loadedTasks
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        retrieveTasks()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        retrieveTasks()
        taskTable.reloadData()
        print("view will appear's \(retrievedTasks.count)")
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
        if item["status"] as? Bool == true {
           cell.accessoryType = UITableViewCellAccessoryType.checkmark
            print("status is true")
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.none
        }
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

