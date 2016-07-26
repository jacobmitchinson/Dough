//
//  MondoAPI.swift
//  Dough
//
//  Created by DeepThought on 23/07/2016.
//  Copyright © 2016 Dough. All rights reserved.
//

import Foundation
import Alamofire

enum MondoResult {
    case Success(AnyObject)
    case Failure(ErrorType)
}

struct MondoAPI {
    
    static func generateAuthHeader() -> [String:String]? {
        guard let authToken = AuthData.authToken else { return nil }
        return ["Authorization":"Bearer " + authToken]
    }

    static func request(endPoint: String, completion:(MondoResult) -> Void) {
        let request = Alamofire.request(.GET, Router.APIRoot + MondoEndPoints.transactions.rawValue, parameters: nil, encoding: .JSON, headers: generateAuthHeader())
        
        request.response(queue: GlobalUserInitiatedQueue, responseSerializer: Request.JSONResponseSerializer(options: .AllowFragments), completionHandler: { response in
            switch response.result {
            case let .Success(result):
                completion(.Success(result))
            case let .Failure(error):
                completion(.Failure(error))
            }
        })        
    }
}

