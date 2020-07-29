//
//  FUser.swift
//  CellProject
//
//  Created by Anthony on 7/29/20.
//  Copyright © 2020 Anthony Howe. All rights reserved.
//

import Foundation
import Firebase


class FUser{
    
    
    let objectId: String = ""
    var pushId: String?
    
    var firstname: String = ""
    var lastname: String = ""
    
    class func registerUserWith(email: String, password: String, firstName: String, lastName: String, completion: @escaping (_ error: Error?) -> Void ) {
          
          Auth.auth().createUser(withEmail: email, password: password, completion: { (firuser, error) in
              
              if error != nil {
                  
                  completion(error)
                  return
              }
              
              let fUser = FUser(_objectId: firuser!.user.uid, _pushId: "", _createdAt: Date(), _updatedAt: Date(), _email: firuser!.user.email!, _firstname: firstName, _lastname: lastName, _loginMethod: kEMAIL, _phoneNumber: "", _city: "", _country: "")
              
              
//              saveUserLocally(fUser: fUser)
//              saveUserToFirestore(fUser: fUser)
              completion(error)
              
          })
          
      }
    
    
}
