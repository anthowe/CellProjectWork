//
//  FinishRegistrationViewController.swift
//  CellProject
//
//  Created by Anthony on 7/29/20.
//  Copyright © 2020 Anthony Howe. All rights reserved.
//

import UIKit


class FinishRegistrationViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    
    var email: String!
    var password: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        
        cleanTextFields()
        dismissKeyboard()
    }
    
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        
        if firstNameTextField.text != "" && lastNameTextField.text != "" && phoneTextField.text != ""{
            
            FUser.registerUserWith(email: email!, password: password!, firstName: firstNameTextField!, lastName: lastNameTextField!)
            
        }
    }
    
    
    
    
    
    
    func cleanTextFields(){
        firstNameTextField.text = ""
        lastNameTextField.text = ""
        phoneTextField.text = ""
        
    }
    
    func dismissKeyboard(){
        self.view.endEditing(false)
    }
    
}
