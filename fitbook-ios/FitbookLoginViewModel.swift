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
import ErykIosCommon

private let sessionError = NSError(domain: "No session", code: 0, userInfo: nil)

class FitbookLoginViewModel {

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

    func fitbookLoginAfterFacebookSuccess() -> Completable {
        return fitbookStore
                .login(token: FacebookToken(token: AccessToken.current!.authenticationToken))
                .map { r -> FitbookLoginResult in
                    self.userHelper.setUser(fitbookResult: r)
                    return r
                }
                .asObservable()
                .ignoreElements()
    }

    func fitbookRefereshAfterFacebookSuccess() -> Completable {
        return fitbookStore
                .refresh()
                .map { r -> FitbookLoginResult in
                    self.userHelper.setUser(fitbookResult: r)
                    return r
                }
                .asCompletable()
    }

    func checkLogin() -> Completable {
        if userHelper.isLogged() {
            if !checkFitbookSessionExpired() {
                return Completable.empty()
            } else if !checkFitbookRefreshExpired() {
                return fitbookRefereshAfterFacebookSuccess()
            } else if !checkFacebookSessionExpired() {
                return fitbookLoginAfterFacebookSuccess()
            }
        }
        return Completable.error(sessionError)
    }

}
