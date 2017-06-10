//
//  FitbookLoginService.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 09.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import Foundation
import QuartzCore
import FacebookCore

class FitbookLoginService {

    static let shared = FitbookLoginService()
    let userContext = UserContext.sharedInstance
    let fitbookAlamoService = FitbookAlamoService.shared

    func checkFitbookSessionExpired() -> Bool {
        let currentTime = CACurrentMediaTime()
        if let exp = userContext.fitbookResult?.exp {
            return Double(exp * 1000) - currentTime < 0
        }
        return true
    }

    func checkFacebookSessionExpired() -> Bool {
        if let token = AccessToken.current {
            return Double(token.expirationDate.timeIntervalSince1970) - CACurrentMediaTime() < 0
        }
        return true
    }

    func fitbookLoginAfterFacebookSuccess(loginProtocol: FitbookLoginProtocol) {
        if let tokenString = AccessToken.current?.authenticationToken {
            fitbookAlamoService.login(
                token: FacebookToken(token: tokenString),
                callback: { (result: FitbookLoginResult) in
                self.userContext.setContext(fitbookResult: result)
                loginProtocol.fitbookLogin()
            })
        } else {
            fatalError("tokenString is nil")
        }
    }

    func onlineLoginCheck(loginProtocol: FitbookLoginProtocol) {
        if !checkFitbookSessionExpired() {
            loginProtocol.fitbookLogin()
        } else if !checkFacebookSessionExpired() {
            fitbookLoginAfterFacebookSuccess(loginProtocol: loginProtocol)
        } else {
            loginProtocol.fitbookLogin()
        }
    }

    func checkLogin(loginProtocol: FitbookLoginProtocol) {
        if userContext.isLogged() {
            onlineLoginCheck(loginProtocol: loginProtocol)
        } else {
            loginProtocol.fitbookLogout()
        }
    }

}
