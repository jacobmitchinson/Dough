//
//  SignInViewController.swift
//  Dough
//
//  Created by DeepThought on 23/07/2016.
//  Copyright © 2016 Dough. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var authTokenTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
    }
    
    func setupDelegates() {
        authTokenTextField.delegate = self
    }
    
    @IBAction func signInButtonTapped(sender: AnyObject) {
        
    }
}

extension SignInViewController: UITextFieldDelegate {
    
    @IBAction func didFinishEntering(sender: AnyObject) {
        if
            let textField = sender as? UITextField,
                authToken = textField.text
                where authToken.characters.count > 0 {
            AuthData.authToken = authToken
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


