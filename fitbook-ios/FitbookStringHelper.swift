//
//  FitbookStringHelper.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 11.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

class FitbookStringHelper {

    static let shared = FitbookStringHelper()

    func getRole(isTrainer: Bool) -> String {
        if isTrainer {
            return "Trainer"
        }
        return "User"
    }

}
