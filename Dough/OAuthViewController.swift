//
//  OAuthController.swift
//  Dough
//
//  Created by DeepThought on 24/07/2016.
//  Copyright © 2016 Dough. All rights reserved.
//

import UIKit

enum OAuthViewControllerErrors:ErrorType {
    case FailedToSetupLoginPage
}

class OAuthViewController: UIViewController {

    private var webView: UIWebView!
    private var onCompletion: (MondoResult) -> Void
    private var identifier : String?
    private var mondoAPI:MondoAPI?
    
    init(mondoAPI api:MondoAPI, webViewToLoad:UIWebView, completion:(MondoResult) -> Void) {
        mondoAPI = api
        webView = webViewToLoad
        onCompletion = completion
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        webView.delegate = self
        view = webView
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        requestMondoLoginPage()
    }
    
    private func requestMondoLoginPage() {
        let uuid = NSUUID()
        identifier = uuid.UUIDString
        guard
            let identifier = identifier,
                url = Router.createLoginURL(identifier, clientId: Secrets.clientId) else {
            onCompletion(.Failure(OAuthViewControllerErrors.FailedToSetupLoginPage))
            return
        }
        let request = NSURLRequest(URL: url)
        webView.loadRequest(request)
    }
}

extension OAuthViewController: UIWebViewDelegate {
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        if let url = request.URL where url.scheme == Router.AuthRedirectScheme {
            
            let queryParams = url.queryParams
            if let identitifer = queryParams["state"], code = queryParams["code"] where identitifer == identifier {
                mondoAPI?.authorizeFromCode(code, completion: onCompletion)
                return false
            }
        }
        return true
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        if let error = error {
            onCompletion(.Failure(error))
        }
    }
    
}

extension NSURL {
    
    var queryParams : [String : String] {
        get {
            var params = [String: String]()
            
            if let queryString = self.query {
                
                for part in queryString.componentsSeparatedByString("&") {
                    let split = part.componentsSeparatedByString("=")
                    guard split.count == 2 else { continue }
                    if let key = split[0].stringByRemovingPercentEncoding, value = split[1].stringByRemovingPercentEncoding {
                        params[key] = value
                    }
                }
            }
            
            return params
        }
    }
}
