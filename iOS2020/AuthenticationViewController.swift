//
//  AuthenticationViewController.swift
//  iOS2020
//
//  Created by Luis Angel Ortega on 28/04/20.
//  Copyright © 2020 Luis Angel Ortega. All rights reserved.
//

import LocalAuthentication
import UIKit

class AuthenticationViewController: UIViewController {

    func authenticateUser() {
           let touchIDManager : PITouchIDManager = PITouchIDManager()
           touchIDManager.authenticateUser(success: { () -> () in
               OperationQueue.main.addOperation({ () -> Void in
                   print("SI ESTUVO CORRECTO")
                   self.view.backgroundColor = UIColor.green
               })
           }, failure: { (evaluationError: NSError) -> () in
            
               switch evaluationError.code {
                   case LAError.Code.systemCancel.rawValue:
                       print("Authentication cancelled by the system")
                   case LAError.Code.userCancel.rawValue:
                       print("Authentication cancelled by the user")
                   case LAError.Code.userFallback.rawValue:
                       print("User wants to use a password")
                       OperationQueue.main.addOperation({ () -> Void in
                       })
                   case LAError.Code.touchIDNotEnrolled.rawValue:
                       print("TouchID not enrolled")
                   case LAError.Code.passcodeNotSet.rawValue:
                       print("Passcode not set")
                   default:
                       print("Authentication failed")
                       OperationQueue.main.addOperation({ () -> Void in
                       })
               }
            
           })
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authenticateUser()
    }

}
