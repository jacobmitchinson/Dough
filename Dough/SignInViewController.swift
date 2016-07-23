//
//  SignInViewController.swift
//  Dough
//
//  Created by DeepThought on 23/07/2016.
//  Copyright © 2016 Dough. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var usernameEntered = false
    var passwordEntered = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
    }
    
    func setupDelegates() {
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    @IBAction func signInButtonTapped(sender: AnyObject) {
        
    }
}

extension SignInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


