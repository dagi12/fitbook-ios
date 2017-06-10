//
//  UserDefaultsService.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 09.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import Foundation

struct Keys {
    static let fitbookUserKey = "FITBOOK_USER_KEY"
}

class UserDefaultsService {

    let userDefaults = UserDefaults.standard
    static let shared = UserDefaultsService()

    func setFitbookResult(fitbookResult: FitbookLoginResult) {
        let wrapper = FitbookLoginResultWrapper(fitbookResult)
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: wrapper)
        userDefaults.set(encodedData, forKey: Keys.fitbookUserKey)
    }

    func getFitbookResult() -> FitbookLoginResult? {
        if let data = userDefaults.object(forKey: Keys.fitbookUserKey) {
            if let castedData = data as? Data {
                if let wrapper = NSKeyedUnarchiver.unarchiveObject(with: castedData) {
                    if let resultWrapper = wrapper as? FitbookLoginResultWrapper {
                        return resultWrapper.fitbookLoginResult
                    }
                }
            }
        }
        return nil
    }

}
