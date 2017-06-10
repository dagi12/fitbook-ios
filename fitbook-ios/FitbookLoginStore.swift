//
//  FitbookLoginStore.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 09.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import QuartzCore
import FacebookCore

class FitbookLoginStore {

    static let shared = FitbookLoginStore()
    let userHelper = UserHelper.shared
    let fitbookAlamoStore = FitbookAlamoStore.shared

    func checkFitbookSessionExpired() -> Bool {
        if let exp = userHelper.fitbookResult?.exp {
            let currentTime = NSDate().timeIntervalSince1970
            return Double(exp) - currentTime < 0
        }
        return true
    }

    func checkFacebookSessionExpired() -> Bool {
        if let token = AccessToken.current {
            let currentTime = NSDate().timeIntervalSince1970
            return Double(token.expirationDate.timeIntervalSince1970) - currentTime < 0
        }
        return true
    }

    func manualLogout() {
        userHelper.removeUser()
    }

    func loginCallback(loginDelegate: FitbookLoginDelegate) -> FitbookAlamoStore.Callback {
        return { (result: FitbookLoginResult) in
            self.userHelper.setUser(fitbookResult: result)
            loginDelegate.fitbookLogin()
        }
    }

    func fitbookLoginAfterFacebookSuccess(loginDelegate: FitbookLoginDelegate) {
        if let tokenString = AccessToken.current?.authenticationToken {
            fitbookAlamoStore.login(
                    token: FacebookToken(token: tokenString),
                    callback: loginCallback(loginDelegate: loginDelegate))
        } else {
            fatalError("tokenString is nil")
        }
    }

    func onlineLoginCheck(loginDelegate: FitbookLoginDelegate) {
        if !checkFitbookSessionExpired() {
            loginDelegate.fitbookLogin()
        } else if !checkFacebookSessionExpired() {
            fitbookLoginAfterFacebookSuccess(loginDelegate: loginDelegate)
        } else {
            loginDelegate.fitbookLogout(nil)
        }
    }

    func checkLogin(loginDelegate: FitbookLoginDelegate) {
        if userHelper.isLogged() {
            onlineLoginCheck(loginDelegate: loginDelegate)
        } else {
            loginDelegate.fitbookLogout(nil)
        }
    }

}
