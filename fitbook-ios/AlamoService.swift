//
//  AlamoService.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 09.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import Foundation

class AlamoService {

    let URL = "http://fitbook-api.herokuapp.com/api/"
    let userContext = UserContext.sharedInstance

    typealias SwiftyJsonResult = [[String: Any]]

    func constructUrl(endpoint: String) -> String {
        return URL + endpoint
    }

    func getHeader() -> [String: String] {
        if (userContext.isLogged()) {
            return ["Authorization": "Bearer " + userContext.fitbookResult!.token!]
        }
        return [:]
    }

}
