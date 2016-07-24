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
    @IBOutlet weak var enterAuthTokenTextField: UITextField!
    var presenter:AuthPresenter?
    
    private enum LandingPageSegues:String {
        case StartGame = "StartGameSegue"
        case SignIn = "SignInSegue"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = Auth()
    }
    
    private enum LandingViewControllerSegues:String {
        case signIn = "SignIn"
    }

    @IBAction func signInButtonTapped(sender: AnyObject) {
        performSegueWithIdentifier(LandingPageSegues.SignIn.rawValue, sender: self)
    }
    
    // can't do this yet as will need to have to universal links :(
    func signInViaOAuth() {
        presenter?.present(onTopOf: self) { [weak self] result in
            guard let strongSelf = self else {
                return
            }
            
            switch result {
            case .Success:
                strongSelf.performSegueWithIdentifier(LandingPageSegues.StartGame.rawValue, sender: strongSelf)
            case let .Failure(error):
                debugPrint("Failed to get mondo credentials: \(error)")
            }
        }
    }
}




