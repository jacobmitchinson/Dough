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

class LandingViewControllerTests: DoughTests {
    
    override func spec() {
        super.spec()
        
        var viewController: LandingViewController!
        
        beforeEach() {
            let storyBoard = UIStoryboard(name: "Landing", bundle: nil)
            viewController =  storyBoard.instantiateViewControllerWithIdentifier("LandingViewControllerStoryboardId") as! LandingViewController
            _ = viewController.view
        }
        
        context("sign in") {
            
            it("button tapped should present mondo login web view") {
                
                class MockPresenter: AuthPresenter {
                    var presentingViewController:UIViewController!
                    func present(onTopOf presenter: UIViewController, completion: (MondoResult) -> Void) {
                        presentingViewController = presenter
                    }
                }
                
                let button = UIButton()
                let presenter = MockPresenter()
                viewController.presenter = presenter
                viewController.signInButtonTapped(button)
                expect(presenter.presentingViewController.isKindOfClass(LandingViewController)).to(beTrue())
            }
            
            describe("success") {
                it("should segue to start game") {
                    class MockPresenter: AuthPresenter {
                        func present(onTopOf presenter: UIViewController, completion: (MondoResult) -> Void) {
                            completion(.Success(""))
                        }
                    }
                    
                    class MockViewController: LandingViewController {
                        var segueToPerform: String!
                        override func performSegueWithIdentifier(identifier: String, sender: AnyObject?) {
                            segueToPerform = identifier
                        }
                    }
                    
                    let button = UIButton()
                    let presenter = MockPresenter()
                    let viewController = MockViewController()
                    viewController.presenter = presenter
                    viewController.signInButtonTapped(button)
                expect(viewController.segueToPerform).to(equal("StartGameSegue"))
                }
            }
        }
    }
}
