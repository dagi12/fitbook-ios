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
    
    func onlineLoginCheck(loginProtocol: FitbookLoginProtocol) {
        if (!checkFitbookSessionExpired() && !checkFacebookSessionExpired()) {
            
        } else {
            loginProtocol.onLogout()
        }
    }
    
    func checkLogin(loginProtocol: FitbookLoginProtocol) {
        if (userContext.isLogged()) {
            onlineLoginCheck(loginProtocol: loginProtocol)
        } else {
            loginProtocol.onLogout()
        }
    }
    
}
