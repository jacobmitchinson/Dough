//
//  AuthData.swift
//  Dough
//
//  Created by DeepThought on 24/07/2016.
//  Copyright © 2016 Dough. All rights reserved.
//

import Nimble
import Quick
@testable import Dough

class AuthDataTests: DoughTests {

    override func spec() {
        it("should store the auth token") {
            AuthData.authToken = "1234"
            expect(AuthData.authToken).to(equal("1234"))
        }
    }
}
