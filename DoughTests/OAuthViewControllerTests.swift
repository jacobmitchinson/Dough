//
//  OAuthViewControllerTests.swift
//  Dough
//
//  Created by DeepThought on 24/07/2016.
//  Copyright © 2016 Dough. All rights reserved.
//

import Nimble
import Quick
@testable import Dough

class OAuthViewControllerTests: DoughTests {
    
    override func spec() {
        super.spec()
        
        it("should load mondo login web page") {
            let webView = UIWebView()
            let viewController = OAuthViewController(mondoAPI:MondoAPI(), webViewToLoad: webView, completion: {_ in})
            _ = viewController.viewWillAppear(true)
            expect(viewController.view).to(equal(webView))
        }
        
        pending("should start the the load request") {
            let webView = UIWebView()
            let viewController = OAuthViewController(mondoAPI:MondoAPI(), webViewToLoad: webView, completion: {_ in})
//            viewController.webView(webView, shouldStartLoadWithRequest: , navigationType: )
            
        }
    }
}
