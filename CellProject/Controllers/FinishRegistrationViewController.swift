//
//  FinishRegistrationViewController.swift
//  CellProject
//
//  Created by Anthony on 7/29/20.
//  Copyright © 2020 Anthony Howe. All rights reserved.
//

import UIKit
import ProgressHUD


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
        
        dismissKeyboard()
            ProgressHUD.show("Registering...")
            
            if firstNameTextField.text != "" && lastNameTextField.text != "" && phoneTextField.text != "" {
                
                FUser.registerUserWith(email: email!, password: password!, firstName: firstNameTextField.text!, lastName: lastNameTextField.text!){
                    
                    (error) in
                    if error != nil{
                        ProgressHUD.dismiss()
                        ProgressHUD.showError(error!.localizedDescription)
                        return
                    }
                    self.registerUser()
                    
                }
            }else{
                ProgressHUD.show("All fields are required")
            }
            
        }
    
    func registerUser(){
        let fullName = firstNameTextField.text! + " " + lastNameTextField.text!
        
        var  tempDictionary: Dictionary = [kFIRSTNAME: firstNameTextField.text!, kLASTNAME: lastNameTextField.text!,  kPHONE: phoneTextField.text!] as [String: Any]
//        if avatarImage == nil {
//            imageFromInitials(firstName: nameTextField.text!, lastName: surnameTextField.text!) { (avatarInitials) in
//
//                let avatarIMG = avatarInitials.jpegData(compressionQuality: 0.7)
//                let avatar = avatarIMG?.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
//
//                tempDictionary[kAVATAR] = avatar
//
//                self.finishRegistration(withValues: tempDictionary)            }
//        }else {
//            let avatarData = avatarImage?.jpegData(compressionQuality: 0.5)
//            let avatar = avatarData!.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
//
//            tempDictionary[kAVATAR] = avatar
            
            self.finishRegistration(withValues: tempDictionary)
            
        }
        
    
    
    func finishRegistration(withValues: [String: Any]){
        
        updateCurrentUserInFirestore(withValues: withValues) { (error) in
            
            if error != nil{
                DispatchQueue.main.async {
                    ProgressHUD.showError(error!.localizedDescription)
                    print(error!.localizedDescription)
                }
                return
            }
            ProgressHUD.dismiss()
            self.goToApp()
            
            
            
        }
        
    }
    
    func goToApp(){
         cleanTextFields()
         dismissKeyboard()
        
         
         NotificationCenter.default.post(name: NSNotification.Name(rawValue: USER_DID_LOGIN_NOTIFICATION), object: nil, userInfo: [kUSERID : FUser.currentId()])
         
     
        let mainView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainApplication") 
             
             
             self.present(mainView, animated: true, completion: nil)
         
      
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
