//
//  FitbookLoginResultWrapper.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 09.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import Foundation


@objc(FitbookLoginResultWrapper)
class FitbookLoginResultWrapper: NSObject, NSCoding {

    struct Keys {
        static let RESULT_KEY = "RESULT_KEY"
    }
    
    var fitbookLoginResult: FitbookLoginResult?
    

    func encode(with aCoder: NSCoder) {
        if let result = self.fitbookLoginResult {
            aCoder.encode(result, forKey: Keys.RESULT_KEY)
        }
    }
    
    init(_ fitbookResult: FitbookLoginResult) {
        self.fitbookLoginResult = fitbookResult
    }
    
    required init?(coder aDecoder: NSCoder) {
        if let result = aDecoder.decodeObject(forKey: Keys.RESULT_KEY) as? FitbookLoginResult {
            self.fitbookLoginResult = result
        }
    }
    
    
}
