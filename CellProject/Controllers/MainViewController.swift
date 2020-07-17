//
//  ViewController.swift
//  CellProject
//
//  Created by Anthony Howe on 2/13/20.
//  Copyright © 2020 Anthony Howe. All rights reserved.
//

import UIKit
import Firebase

class MainViewController: UIViewController {
    
private let dataSource = ["AT&T", "Verizon", "Tracfone", "Lyca"]
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var detailLabel: UILabel!
    var leftBarButtonItem : UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       // navigationItem.title="Root View"
        self.leftBarButtonItem = UIBarButtonItem(title: "test", style:         UIBarButtonItem.Style.plain, target: nil, action: nil)
        pickerView.delegate = self
        pickerView.dataSource = self
        
    }

    
    @IBAction func buyNowPressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToVerizon", sender: self)
    }
    
    @IBAction func attButtonPressed(_ sender: UIButton) {
        
         self.performSegue(withIdentifier: "goToATT", sender: self)
        
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        print("Log Out Pressed")
        do{
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        }catch let signOutError as NSError{
            print("Error signing out: %@", signOutError)
        }
        
    }
  
    @IBAction func donePressed(_ sender: Any) {
        
      

    }
    
}
extension MainViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSource.count
    }
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        detailLabel.text = dataSource[row]
        if row == 0 {
            let vcOne = storyboard?.instantiateViewController(withIdentifier: "carrierViewController") as! CarrierViewController
            present(vcOne, animated: true, completion: nil)
            // first selection, initialize the VC related with it
        } else if row == 1 {
            let vcTwo = storyboard?.instantiateViewController(withIdentifier: "carrierViewController") as! CarrierViewController
            present(vcTwo, animated: true, completion: nil)
            // second selection, initialize the VC related with it
        } else {
            // other selections, you get the idea, you can also do switch-case
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataSource[row]
    }
  }

