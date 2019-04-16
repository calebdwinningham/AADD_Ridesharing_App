//
//  DecisionViewController.swift
//  AADD_Ridesharing
//
//  Created by Caleb Winningham on 4/10/19.
//  Copyright © 2019 Caleb Winningham. All rights reserved.
//

import UIKit
import Foundation
import Firebase
import FirebaseAuth

class DecisionViewController:UIViewController, UITextFieldDelegate {
    
    
    @IBAction func logoutAction(_ sender: Any) {
        self.performSegue(withIdentifier: "LogoutAction", sender: nil)
    }
    
    func showSuccessAlert(_ sender: UIButton){
        
        // create the alert
        let alert = UIAlertController(title: "Success", message: "Your account has been created. Please verify your email.", preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "Awesome!", style: UIAlertAction.Style.default, handler: {_ in
            self.performSegue(withIdentifier: "CreateSuccess", sender: nil)
        }))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
}
