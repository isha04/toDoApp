//
//  tasks.swift
//  todo
//
//  Created by amarjeet on 28/12/17.
//  Copyright © 2017 amarjeet. All rights reserved.
//

import Foundation
import UIKit

struct taskToDo {
    var taskTitle: String
    var dueDate: String
    var status: Bool
}

var tasks = [taskToDo]()

    
func saveTask(taskTitle: String, dueDate: String, status: Bool){
    tasks.append(taskToDo(taskTitle: taskTitle, dueDate: dueDate, status: status))
}


