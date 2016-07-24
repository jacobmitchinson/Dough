//
//  MondoAPI.swift
//  Dough
//
//  Created by DeepThought on 23/07/2016.
//  Copyright © 2016 Dough. All rights reserved.
//

import Foundation

enum MondoResult {
    case Success(AnyObject)
    case Failure(ErrorType)
}

struct MondoAPI {
    func authorizeFromCode(code : String, completion: (MondoResult) -> Void) {
        // can't do this without universal links setup :(
    }
}
