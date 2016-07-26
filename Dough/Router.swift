//
//  Router.swift
//  Dough
//
//  Created by DeepThought on 24/07/2016.
//  Copyright © 2016 Dough. All rights reserved.
//

import Foundation

enum MondoEndPoints:String {
    case transactions = "transactions"
}

struct Router {
    
    // api 
    static let APIRoot = "https://api.getmondo.co.uk/"
    
    // auth
    static let AuthRoot = "https://auth.getmondo.co.uk/"
    static let AuthRedirectScheme = "dough"
    static let AuthRedirectUri = AuthRedirectScheme + "://success"
    
    static func createLoginURL(identitifer:String, clientId: String) -> NSURL? {
        var url = Router.AuthRoot + "?client_id=" + clientId
        url = url + "&redirect_uri=" + Router.AuthRedirectUri
        url = url + "&response_type=code"
        url = url + "&state=" + identitifer
        
        if let url = NSURL(string: url) {
            return url
        } else {
            return nil
        }
    }
}