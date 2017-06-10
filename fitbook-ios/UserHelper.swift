//
//  UserHelper.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 09.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import Foundation

class UserHelper {

    static let shared = UserHelper()
    let defaultsStore = UserDefaultsStore.shared
    var fitbookResult: FitbookLoginResult?

    init() {
        self.fitbookResult = defaultsStore.getFitbookResult()
    }

    func getUser() -> User? {
        if let user = fitbookResult?.user {
            return user
        }
        return nil
    }

    func isLogged() -> Bool {
        return self.fitbookResult != nil
    }

    func removeUser() {
        self.fitbookResult = nil
        defaultsStore.removeFitbookResult()
    }

    func setUser(fitbookResult: FitbookLoginResult) {
        self.fitbookResult = fitbookResult
        defaultsStore.setFitbookResult(fitbookResult: fitbookResult)
    }

}
