//
//  UserContext.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 09.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import Foundation



class UserContext {
    
    static let sharedInstance = UserContext()
    let defaultsService = UserDefaultsService.shared
    var fitbookResult: FitbookLoginResult?
    var loginPending = false
    
    init() {
        self.fitbookResult = defaultsService.getFitbookResult()
    }
    
    func getUser() -> User? {
        if (fitbookResult != nil) {
            return fitbookResult?.user
        }
        return nil
    }
    
    func isLogged() -> Bool {
        return self.fitbookResult != nil
    }
    
    func setContext(fitbookResult: FitbookLoginResult) {
        self.fitbookResult = fitbookResult
        defaultsService.setFitbookResult(fitbookResult: fitbookResult)
    }
    
    
}
