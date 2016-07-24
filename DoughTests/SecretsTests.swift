//
//  SecretsTests.swift
//  Dough
//
//  Created by DeepThought on 24/07/2016.
//  Copyright © 2016 Dough. All rights reserved.
//

import Nimble
import Quick
@testable import Dough

class SecretsTests: DoughTests {

    override func spec() {
        super.spec()
        
        it("should contain a client id") {
            expect(Secrets.clientId).toNot(beNil())
        }
        
        it("should contain a client secret") {
            expect(Secrets.clientSecret).toNot(beNil())
        }
    }
}
