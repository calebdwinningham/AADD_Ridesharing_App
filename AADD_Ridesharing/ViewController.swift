//
//  ViewController.swift
//  AADD_Ridesharing
//
//  Created by Caleb Winningham on 4/8/19.
//  Copyright © 2019 Caleb Winningham. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBAction func login(_ sender: Any) {
        attemptLogin()
    }
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBAction func unwindToHome(segue:UIStoryboardSegue) { }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func attemptLogin(){
        guard let email = emailField.text else { return }
        guard let password = passwordField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] user, error in
            guard let strongSelf = self else { return }
            if error == nil {
                print("Logged In")
                self?.performSegue(withIdentifier: "LoginSuccess", sender: nil)
            } else {
                print("Failure")
                self?.errorLabel.text = error?.localizedDescription
            }
            
        }
    }

}

