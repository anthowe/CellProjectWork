//
//  VerizonViewController.swift
//  CellProject
//
//  Created by Anthony Howe on 2/14/20.
//  Copyright © 2020 Anthony Howe. All rights reserved.
//

import UIKit
import SwiftUI

class CarrierViewController: UIViewController {


    @IBOutlet weak var verizonImage: UIImageView!
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()

       
    }
   

    
    
    @IBAction func buyNowPressed(_ sender: UIButton) {
        
        if let url = URL(string: "https://discountedcellularprepaidrefills.com") {
            UIApplication.shared.open(url)
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

}
