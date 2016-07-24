//
//  AuthTests.swift
//  Dough
//
//  Created by DeepThought on 24/07/2016.
//  Copyright © 2016 Dough. All rights reserved.
//

import Nimble
import Quick
@testable import Dough

class AuthTests: DoughTests {

    override func spec() {
        super.spec()
        
        context("sign in") {
            it("should return an OAuthController") {
                let controller = Auth().createAuthViewController({_ in })
                expect(controller).toNot(beNil())
            }
            
            it("should tell presenting view controller to present") {
                class MockViewController: UIViewController {
                    var viewControllerPresented:UIViewController!
                    override func presentViewController(viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?) {
                        viewControllerPresented = viewControllerToPresent
                    }
                }
                let viewController = MockViewController()
                Auth().present(onTopOf: viewController) { _ in}
                expect(viewController.viewControllerPresented.isKindOfClass(OAuthViewController)).to(equal(true))
            }
        }
    }

}
