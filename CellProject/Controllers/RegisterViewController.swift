//
//  RegisterViewController.swift
//  CellProject
//
//  Created by Anthony Howe on 2/18/20.
//  Copyright © 2020 Anthony Howe. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    let db = Firestore.firestore()
    
    var data: [DataToStore] = [DataToStore(email: "")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
          let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
        //MARK - not sure I need
        // db = Firestore.firestore().document("sampleData/emailandpassword")
        
    }
  
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    //var db: DocumentReference!
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        self.passwordTextField.isSecureTextEntry = true
        if let email = emailTextField.text, let password = passwordTextField.text {
                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                    if let e = error {
                       print(e)
                    } else {
                        //Navigate to the ChatViewController
                        self.performSegue(withIdentifier: "goToMainSegue", sender: self)
                    }
                }
            //MARK - Adding db functionality
            if let emailText = Auth.auth().currentUser?.email{
                db.collection(K.FStore.email).addDocument(data: [K.FStore.email: emailText]) { (error) in
                    if let e = error {
                        print("There was an issue saving data to Firestore: \(e)")
                    }else{
                        print("Successfully saved data")
                    }
                }
            }
            //!emailText.isEmpty else {return}
            //guard let passwordText = passwordTextField.text, !passwordText.isEmpty else {return}
            //let dataToSave: [String: Any] = ["email": emailText]
            //db.collection(K.FStore.email)
       
        }
        }
    
   
    
}
    



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


