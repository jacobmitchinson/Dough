//
//  SignInViewController.swift
//  Dough
//
//  Created by DeepThought on 23/07/2016.
//  Copyright © 2016 Dough. All rights reserved.
//

import Nimble
import Quick
@testable import Dough

class SignInViewControllerTests: DoughTests {
    
    override func spec() {
        super.spec()

        var viewController:SignInViewController!
        
        beforeEach() {
            let storyBoard = UIStoryboard(name: "SignIn", bundle: nil)
            viewController = storyBoard.instantiateViewControllerWithIdentifier("SignInViewControllerStoryboardId") as! SignInViewController
            _ = viewController.view
        }
        
        context("entering credentials") {
            it("should be able to set auth token") {
                let authToken = "authToken"
                viewController.authTokenTextField.text = authToken
                expect(viewController.authTokenTextField.text).to(equal(authToken))
            }
        }
    }
}
