//
//  createTask.swift
//  todo
//
//  Created by amarjeet on 29/12/17.
//  Copyright © 2017 amarjeet. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

class createTask: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var taskToEnter: UITextField!
    @IBOutlet weak var datePickerField: UITextField!

    
    var datePickerObject = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskToEnter.delegate = self
        datePickerField.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    func pickDate(field: UITextField) {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector (datePickerDone))
        toolbar.setItems([doneButton], animated: true)
        field.inputAccessoryView = toolbar
        let dateFormatter = DateFormatter()
        datePickerObject.minimumDate = Date()
        field.inputView = datePickerObject
        let selectedDate = datePickerObject.date
        field.text = dateFormatter.string(from: selectedDate)
    }
    
    @objc func datePickerDone() {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateStyle = .full
        dateFormatter.dateFormat = "EEEE, dd MMMM yyyy, h:mm a"
        datePickerField.text = dateFormatter.string(from: datePickerObject.date)
        self.view.endEditing(true)
    }
    
    
    @IBAction func addDate(_ sender: Any) {
        pickDate(field: datePickerField)
    }
    
    @IBAction func didTapOnSaveButton(_ sender: Any) {
        if taskToEnter.text != "" {
            saveNewTask(taskTitle: taskToEnter.text!, dueDate: datePickerField.text!, status: false)
            if datePickerField.text != "" {
                scheduleLocalNotification()
            }
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    private func scheduleLocalNotification() {
        //Setting date to trigger notification
        let date = Date(timeIntervalSinceNow: 20)
        let triggerDate = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second,], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
        
        //Notification Content
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "Task is due"
        notificationContent.subtitle = taskToEnter.text!
        notificationContent.sound = UNNotificationSound.default()
        
        //create a new notification request and add it to the notification center
        let identifier = "To-Do app local notification"
        let request = UNNotificationRequest(identifier: identifier,
                                            content: notificationContent, trigger: trigger)
        let center = UNUserNotificationCenter.current()
        center.add(request, withCompletionHandler: { (error) in
            if error != nil {
                print("something is wrong")
            }
        })
        let snoozeAction = UNNotificationAction(identifier: "Snooze",
                                                title: "Snooze", options: [])
        let deleteAction = UNNotificationAction(identifier: "UYLDeleteAction",
                                                title: "Delete", options: [.destructive])
        let category = UNNotificationCategory(identifier: "UYLReminderCategory",
                                              actions: [snoozeAction,deleteAction],
                                              intentIdentifiers: [], options: [])
        center.setNotificationCategories([category])
        notificationContent.categoryIdentifier = "UYLReminderCategory"
      
    }
    
}
