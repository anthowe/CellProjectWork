//
//  RegisterViewController.swift
//  CellProject
//
//  Created by Anthony Howe on 2/18/20.
//  Copyright © 2020 Anthony Howe. All rights reserved.
//

import UIKit
import ProgressHUD

class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var reenterPasswordTextField: UITextField!
    
    
  var email: String!
       var password: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
   
    //MARK: IBACTIONS
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        dismissKeyboard()
        if emailTextField.text != "" && passwordTextField.text != "" {
            loginUser()
            print("login")
        }
        else {
            ProgressHUD.showError("email and password are required")
        }
    }
    
    
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        dismissKeyboard()
        if emailTextField.text != "" && passwordTextField.text != "" && reenterPasswordTextField.text != "" {
           
            if passwordTextField.text == reenterPasswordTextField.text{
            registerUser()
            print("register")
            }
            else {
                ProgressHUD.showError("Passwords do not match!")
            }
        }
                else {
                    ProgressHUD.showError("All fields are required!")
                }
        
    }
    
    
    @IBAction func backgroundTap(_ sender: Any) {
        dismissKeyboard()
    }
    
    
    
  
    
    func registerUser(){
        
        performSegue(withIdentifier: "finishRegSegue", sender: self)
       
        cleanTextFields()
        dismissKeyboard()
        
        
        
    }
    
    
    //MARK: HelperFunctions
    
    func loginUser(){
        ProgressHUD.show("Login...")
        
        FUser.loginUserWith(email: email!, password: password!)
        { (error) in
            
            
            if error != nil {
                ProgressHUD.showError(error!.localizedDescription)
                return
            }
            self.goToApp()
            
        }
        
        
        
    }
    
    func cleanTextFields(){
        
        emailTextField.text = ""
        passwordTextField.text = ""
        reenterPasswordTextField.text = ""
    }
    
    func dismissKeyboard(){
          
          self.view.endEditing(false)
    }
    
    
    //MARK: GoToApp
    func goToApp(){
        
        ProgressHUD.dismiss()
        cleanTextFields()
        dismissKeyboard()
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: USER_DID_LOGIN_NOTIFICATION),  object: nil, userInfo: [kUSERID : FUser.currentId()])
        
        let mainView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainApplication")
        
        self.present(mainView, animated: true, completion: nil)
        
        
    }
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "finishRegSegue"{
            let vc = segue.destination as! FinishRegistrationViewController
            vc.email = emailTextField.text!
            vc.password = passwordTextField.text!
        }
    }

           
            
       
        
    
}
//import UIKit
//import Firebase
//
//class RegisterViewController: UIViewController {
//
//    let db = Firestore.firestore()
//
// //   var data: [DataToStore] = [DataToStore(email: "")]
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//          let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
//        view.addGestureRecognizer(tap)
//
//        //MARK - not sure I need
//        // db = Firestore.firestore().document("sampleData/emailandpassword")
//
//    }
//
//
//    @IBOutlet weak var emailTextField: UITextField!
//
//
//    @IBOutlet weak var passwordTextField: UITextField!
//
//    //var db: DocumentReference!
//
//    @IBAction func registerButtonPressed(_ sender: UIButton) {
//        self.passwordTextField.isSecureTextEntry = true
//        if let email = emailTextField.text, let password = passwordTextField.text {
//                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
//                    if let e = error {
//                       print(e)
//                    } else {
//                        //Navigate to the ChatViewController
//                        self.performSegue(withIdentifier: "finishRegSegue", sender: self)
//                    }
//                }
//            //MARK - Adding db functionality
//            if let emailText = Auth.auth().currentUser?.email{
//                db.collection(kEMAIL).addDocument(data: [kEMAIL: emailText]) { (error) in
//                    if let e = error {
//                        print("There was an issue saving data to Firestore: \(e)")
//                    }else{
//                        print("Successfully saved data")
//                    }
//                }
//            }
//            //!emailText.isEmpty else {return}
//            //guard let passwordText = passwordTextField.text, !passwordText.isEmpty else {return}
//            //let dataToSave: [String: Any] = ["email": emailText]
//            //db.collection(K.FStore.email)
//
//        }
//        }
//
//
//
//}
//
//
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */


