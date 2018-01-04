//
//  tasks.swift
//  todo
//
//  Created by amarjeet on 28/12/17.
//  Copyright © 2017 amarjeet. All rights reserved.
//

import Foundation
import UIKit

//struct taskToDo {
//    var taskTitle: String
//    var dueDate: String
//    var status: Bool
//}
struct taskToDo {
    var taskTitle: String
    var dueDate: String
    var status: Bool
    var data: [String: Any] {
        return ["taskTitle": taskTitle,
                "dueDate": dueDate,
                "status": status]
    }
    var nsDictionary: NSDictionary {
        return data as NSDictionary
    }
}
var tasks = [[String: Any]]()

func retrieveTasks() {
    if (UserDefaults.standard.array(forKey: "mytasks") as? [[String: Any]]) != nil {
        tasks = (UserDefaults.standard.array(forKey: "mytasks") as? [[String: Any]])!
    }
}

func saveNewTask(taskTitle: String, dueDate: String, status: Bool) {
    let atask = taskToDo(taskTitle: taskTitle , dueDate: dueDate, status: status)
    tasks.insert(atask.data, at: 0)
    saveTask (inputArray: tasks)
}

func saveTask (inputArray: [[String: Any]]) {
    UserDefaults.standard.set(inputArray, forKey: "mytasks")
    UserDefaults.standard.synchronize()
}

func updateTask (newData: [String: Any], oldArray: inout [[String: Any]], index: Int) {
  var oldData = oldArray[index]
    oldData = newData
    oldArray[index] = oldData
    saveTask(inputArray: oldArray)
    
}
