//
//  RegistrationViewController.swift
//  AADD_Ridesharing
//
//  Created by Caleb Winningham on 4/8/19.
//  Copyright © 2019 Caleb Winningham. All rights reserved.
//
import UIKit
import Foundation
import Firebase
import FirebaseAuth

class RegistrationViewController:UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBAction func backAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@gmail.com"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    @IBAction func register(_ sender: UIButton) {
        guard let email = emailField.text else { return }
        guard let password = passwordField.text else { return }
        
        if isValidEmail(testStr: email) == false{
            self.errorLabel.text = "Email invalid. Please ensure you are using a valid us.af.mil address!"
        } else {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            print(error?.localizedDescription)
            if error == nil {
                print("Created")
                self.showSuccessAlert(self.registerButton)
                Auth.auth().currentUser?.sendEmailVerification { (error) in
                    print("Sent Verification")
                }
            } else {
                print("Error creating user")
                self.errorLabel.text = error?.localizedDescription
            }
        }
            
        }
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
