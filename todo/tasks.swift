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



func saveTask(taskTitle: String, dueDate: String, status: Bool){
    var atask = taskToDo(taskTitle: taskTitle , dueDate: dueDate, status: status)
    tasks.append(atask.data)
//    let userDefaults = UserDefaults.standard
//    userDefaults.setValue(NSKeyedArchiver.archivedData(withRootObject: tasks), forKey: "tasks")
//    userDefaults.synchronize()
//    let data = NSKeyedArchiver.archivedData(withRootObject: tasks)
//    UserDefaults.standard.set(data, forKey: "tasks")
//    UserDefaults.standard.synchronize()
}








//protocol PropertyListReadable {
//    func propertyListRepresentation() -> NSDictionary
//    init?(propertyListRepresentation:NSDictionary?)
//}
//
//func extractValuesFromPropertyListArray<T:PropertyListReadable>(propertyListArray:[AnyObject]?) -> [T] {
//    guard let encodedArray = propertyListArray else {return []}
//    return encodedArray.map{$0 as? NSDictionary}.flatMap{T(propertyListRepresentation:$0)}
//}
//
//func saveValuesToDefaults<T:PropertyListReadable>(newValues:[T], key:String) {
//    let encodedValues = newValues.map{$0.propertyListRepresentation()}
//    UserDefaults.standard.set(encodedValues, forKey:key)
//}
//
//struct taskToDo {
//    var taskTitle:String
//    var dueDate:String
//    var status:Bool
//
//    init(taskTitle: String, dueDate: String, status: Bool) {
//        self.taskTitle = taskTitle
//        self.dueDate = dueDate
//        self.status = status
//    }
//}
//
//extension taskToDo: PropertyListReadable {
//    func propertyListRepresentation() -> NSDictionary {
//        let representation:[String:AnyObject] = ["taskTitle":self.taskTitle as AnyObject, "dueDate":self.dueDate as AnyObject, "status":self.status as AnyObject]
//        return representation as NSDictionary
//    }
//
//    init?(propertyListRepresentation:NSDictionary?) {
//        guard let values = propertyListRepresentation else {return nil}
//        if let title = values["taskTitle"] as? String,
//            let date = values["dueDate"] as? String,
//            let taskStatus = values["status"] as? Bool {
//            self.taskTitle = title
//            self.dueDate = date
//            self.status = taskStatus
//        } else {
//            return nil
//        }
//    }
//}


