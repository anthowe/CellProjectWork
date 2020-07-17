//
//  WelcomeViewController.swift
//  CellProject
//
//  Created by Anthony Howe on 2/18/20.
//  Copyright © 2020 Anthony Howe. All rights reserved.
//

import UIKit
import Firebase

class WelcomeViewController: UIViewController {
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
        
    }
    
//    override func viewDidAppear(_ animated: Bool){
//        super.viewDidAppear(animated)
//        if Auth.auth().currentUser != nil {
//            self.performSegue(withIdentifier: "alreadyLoggedIn", sender: nil)
//        }
//    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    



    
}
