//
//  FitbookLoginStore.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 09.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import QuartzCore
import FacebookCore
import RxSwift

class FitbookLoginStore {

    let bag = DisposeBag()
    let userHelper: UserHelper
    let fitbookStore: FitbookStore

    init(userHelper: UserHelper, fitbookStore: FitbookStore) {
        self.userHelper = userHelper
        self.fitbookStore = fitbookStore
    }

    func checkFitbookSessionExpired() -> Bool {
        if let exp = userHelper.fitbookResult?.exp {
            let currentTime = NSDate().timeIntervalSince1970
            return Double(exp) - currentTime < 0
        }
        return true
    }

    func checkFitbookRefreshExpired() -> Bool {
        if let iss = userHelper.fitbookResult?.iss {
            let currentTime = NSDate().timeIntervalSince1970
            return Double(iss) - currentTime < 0
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

    func fitbookLoginAfterFacebookSuccess(loginDelegate: FitbookLoginDelegate) {
        fitbookStore
            .login(token: FacebookToken(token: AccessToken.current!.authenticationToken))
            .subscribe(onSuccess: {
                self.userHelper.setUser(fitbookResult: $0)
                loginDelegate.fitbookLogin()
        }).disposed(by: bag)
    }

    func fitbookRefereshAfterFacebookSuccess(loginDelegate: FitbookLoginDelegate) {
        fitbookStore
            .refresh()
            .subscribe(onSuccess: {
                self.userHelper.setUser(fitbookResult: $0)
                loginDelegate.fitbookLogin()
            }).disposed(by: bag)
    }

    func onlineLoginCheck(loginDelegate: FitbookLoginDelegate) {
        if !checkFitbookSessionExpired() {
            loginDelegate.fitbookLogin()
        } else if !checkFitbookRefreshExpired() {
            fitbookRefereshAfterFacebookSuccess(loginDelegate: loginDelegate)
        } else if !checkFacebookSessionExpired() {
            fitbookLoginAfterFacebookSuccess(loginDelegate: loginDelegate)
        } else {
            loginDelegate.fitbookLogout(false)
        }
    }

    func checkLogin(loginDelegate: FitbookLoginDelegate) {
        if userHelper.isLogged() {
            onlineLoginCheck(loginDelegate: loginDelegate)
        } else {
            loginDelegate.fitbookLogout(false)
        }
    }

}
