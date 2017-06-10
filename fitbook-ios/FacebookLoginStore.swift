//
//  FacebooLoginStore.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 09.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import Foundation
import FacebookLogin

class FacebookLoginStore: LoginButtonDelegate {

    let loginDelegate: FacebookLoginResultDelegate

    init(loginDelegate: FacebookLoginResultDelegate) {
        self.loginDelegate = loginDelegate
    }

    func loginButtonDidCompleteLogin(_ loginButton: LoginButton, result: LoginResult) {
        switch result {
        case .cancelled:
            loginDelegate.facebookLoginFailed()
            break
        case .failed:
            loginDelegate.facebookLoginFailed()
            break
        case .success:
            loginDelegate.facebookLoginSuccess()
            break
        }
    }

    func loginButtonDidLogOut(_ loginButton: LoginButton) {
        // no need
    }

}
