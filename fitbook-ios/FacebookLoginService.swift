//
//  LoginService.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 09.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import Foundation
import FacebookLogin

class FacebookLoginService: LoginButtonDelegate {
    
    let loginResultProtocol: FacebookLoginResultProtocol
    
    init(loginResultProtocol: FacebookLoginResultProtocol) {
        self.loginResultProtocol = loginResultProtocol
    }
    
    func loginButtonDidCompleteLogin(_ loginButton: LoginButton, result: LoginResult) {
        switch (result) {
        case .cancelled:
            loginResultProtocol.facebookLoginFailed()
            break
        case .failed:
            loginResultProtocol.facebookLoginFailed()
            break
        case .success:
            loginResultProtocol.facebookLoginSuccess()
            break
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: LoginButton) {
        loginResultProtocol.facebookLogout()
    }
    
    
}
