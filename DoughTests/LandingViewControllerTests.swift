//
//  LandingViewController.swift
//  Dough
//
//  Created by DeepThought on 23/07/2016.
//  Copyright © 2016 Dough. All rights reserved.
//

import Nimble
import Quick
@testable import Dough

class LandingViewControllerTests: QuickSpec {
    
    override func spec() {
        super.spec()
        
        var viewController: LandingViewController!
        
        beforeEach() {
            let storyBoard = UIStoryboard(name: "Landing", bundle: nil)
            viewController =  storyBoard.instantiateViewControllerWithIdentifier("LandingViewControllerStoryboardId") as! LandingViewController
            _ = viewController.view
        }
        
        context("sign in") {
            it("should have button") {
                expect(viewController.signInButton).toNot(beNil())
            }
            
            it("button tapped should segue to sign in view controller") {
                class LandingMock:LandingViewController {
                    var savedSegue:String?
                    
                    override func performSegueWithIdentifier(identifier: String, sender: AnyObject?) {
                        savedSegue = identifier
                    }
                }
                
                let viewController = LandingMock()
                let button = UIButton()
                viewController.signInButtonTapped(button)
                expect(viewController.savedSegue).to(equal("SignIn"))
            }
        }
        
    }
}
