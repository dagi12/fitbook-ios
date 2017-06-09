//
//  UserDefaultsService.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 09.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import Foundation

struct Keys {
    static let FITBOOK_USER_KEY = "FITBOOK_USER_KEY"
}

class UserDefaultsService {
    
    let userDefaults = UserDefaults.standard
    static let shared = UserDefaultsService()
    
    func setFitbookResult(fitbookResult: FitbookLoginResult) {
        let wrapper = FitbookLoginResultWrapper(fitbookResult)
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: wrapper)
        userDefaults.set(encodedData, forKey: Keys.FITBOOK_USER_KEY)
    }
    
    func getFitbookResult() -> FitbookLoginResult? {
        if let data = userDefaults.data(forKey: Keys.FITBOOK_USER_KEY) {
            if let wrapper =  NSKeyedUnarchiver.unarchiveObject(with: data) as? FitbookLoginResultWrapper {
                return wrapper.fitbookLoginResult
            }
        }
        return nil
    }
    
    
    
    
}
