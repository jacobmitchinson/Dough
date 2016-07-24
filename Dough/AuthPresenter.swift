//
//  AuthPresenter.swift
//  Dough
//
//  Created by DeepThought on 24/07/2016.
//  Copyright © 2016 Dough. All rights reserved.
//

import UIKit

protocol AuthPresenter {
    func present(onTopOf presenter: UIViewController, completion:(MondoResult) -> Void)
}

struct Auth: AuthPresenter {
    
    func present(onTopOf presenter: UIViewController, completion: (MondoResult) -> Void) {
        let oAuthViewController = createAuthViewController(completion)
        presenter.presentViewController(oAuthViewController, animated: true, completion: nil)
    }
    
    func createAuthViewController(completion: (MondoResult) -> Void) -> OAuthViewController {
        return OAuthViewController(completion: completion)
    }
    
}