//
//  ViewController.swift
//  todo
//
//  Created by amarjeet on 28/12/17.
//  Copyright © 2017 amarjeet. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var taskTable: UITableView!
    
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
        return tasks.count
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = taskTable.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! tableCells
        let item = tasks[indexPath.row]
        cell.titleLabel?.text = item.taskTitle
        cell.dueDateLabel?.text = item.dueDate
        cell.accessoryType = item.status ? .checkmark : .none
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = tasks[indexPath.row]
        item.status != item.status
    }
    
    
    @IBAction func addButton(_ sender: Any) {
        performSegue(withIdentifier: "addTask", sender: sender)
    }
    
    


}

