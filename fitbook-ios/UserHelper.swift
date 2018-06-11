//
//  UserHelper.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 09.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//
import ErykIosCommon

class UserHelper {

    let defaultsStore: UserDefaultsStore
    var fitbookResult: FitbookLoginResult?

    init (defaultsStore: UserDefaultsStore) {
        self.defaultsStore = defaultsStore
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
        try? defaultsStore.removeFitbookResult()?.save()
    }

    func setUser(fitbookResult: FitbookLoginResult) {
        self.fitbookResult = fitbookResult
        BaseUrlStore.sharedInstance.token = fitbookResult.token
        defaultsStore.setFitbookResult(fitbookResult: fitbookResult)
    }

}
