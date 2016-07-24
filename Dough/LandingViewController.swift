//
//  ViewController.swift
//  Dough
//
//  Created by DeepThought on 23/07/2016.
//  Copyright © 2016 Dough. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {
    
    @IBOutlet weak var signInButton: UIButton!
    
    private enum LandingViewControllerSegues:String {
        case signIn = "SignIn"
    }

    @IBAction func signInButtonTapped(sender: AnyObject) {
        signIn()
    }
    
    func signIn() {
        
    }
}

