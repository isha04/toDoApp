//
//  createTask.swift
//  todo
//
//  Created by amarjeet on 29/12/17.
//  Copyright © 2017 amarjeet. All rights reserved.
//

import Foundation
import UIKit

class createTask: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var taskToEnter: UITextField!
    @IBOutlet weak var datePickerField: UITextField!

    
    var datePickerObject = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //pickDate()
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
            saveTask(taskTitle: taskToEnter.text!, dueDate: datePickerField.text!, status: false)
            self.navigationController?.popViewController(animated: true)
        }
    }

    
}
