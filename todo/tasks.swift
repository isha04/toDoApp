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



func saveTask(taskTitle: String, dueDate: String, status: Bool) {
    let atask = taskToDo(taskTitle: taskTitle , dueDate: dueDate, status: status)
    tasks.append(atask.data)
    UserDefaults.standard.set(tasks, forKey: "mytasks")
    UserDefaults.standard.synchronize()
}
