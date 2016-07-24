//
//  ViewController.swift
//  Dough
//
//  Created by DeepThought on 23/07/2016.
//  Copyright © 2016 Dough. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {
    
    var presenter:AuthPresenter?
    
    private enum LandingPageSegues:String {
        case StartGame = "StartGameSegue"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = Auth()
    }
    
    @IBOutlet weak var signInButton: UIButton!
    
    private enum LandingViewControllerSegues:String {
        case signIn = "SignIn"
    }

    @IBAction func signInButtonTapped(sender: AnyObject) {
        signIn()
    }
    
    func signIn() {
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

