//
//  LoginViewController.swift
//  CellProject
//
//  Created by Anthony Howe on 2/18/20.
//  Copyright © 2020 Anthony Howe. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        passwordTextField.isSecureTextEntry = true
    }
    @IBAction func loginPressed(_ sender: UIButton) {
        
        if let email = emailTextField.text, let password = passwordTextField.text
        {Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let e = error{
                print(e)
            }else{
                self.performSegue(withIdentifier: "goToMainSegue", sender: self)
            }
            
            }
           
            
        }
    }
    
}
