//
//  FacebooLoginStore.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 09.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import FacebookLogin

class FacebookLoginStore: LoginButtonDelegate {

    // swiftlint:disable:next weak_delegate
    let loginDelegate: FacebookLoginResultDelegate

    init(loginDelegate: FacebookLoginResultDelegate) {
        self.loginDelegate = loginDelegate
    }

    func loginButtonDidCompleteLogin(_ loginButton: LoginButton, result: LoginResult) {
        switch result {
        case .cancelled:
            loginDelegate.facebookLoginFailed()
        case .failed:
            loginDelegate.facebookLoginFailed()
        case .success:
            loginDelegate.facebookLoginSuccess()
        }
    }

    func loginButtonDidLogOut(_ loginButton: LoginButton) {
        // no need
    }

}
