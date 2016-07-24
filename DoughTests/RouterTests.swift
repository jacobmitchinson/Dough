//
//  RouterTests.swift
//  Dough
//
//  Created by DeepThought on 24/07/2016.
//  Copyright © 2016 Dough. All rights reserved.
//

import Nimble
import Quick
@testable import Dough

class RouterTests: DoughTests {

    override func spec() {
        super.spec()
        
        it("should create mondo login url") {
            let url = Router.createLoginURL("1234", clientId: "1234")!
            expect(url.absoluteString).to(equal("\(Router.AuthRoot)?client_id=1234&redirect_uri=\(Router.AuthRedirectUri)&response_type=code&state=1234"))
        }
    }
}
