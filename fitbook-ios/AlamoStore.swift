//
//  AlamoStore.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 09.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//
import ObjectMapper
import Alamofire
import AlamofireObjectMapper

class AlamoStore {

    let URL = "http://fitbook-api.herokuapp.com/api/"
    let userHelper = UserHelper.shared

    typealias SwiftyJsonResult = [[String: Any]]

    func constructUrl(endpoint: String) -> String {
        return URL + endpoint
    }

    func getHeader() -> [String: String] {
        if userHelper.isLogged() {
            return ["Authorization": "Bearer " + userHelper.fitbookResult!.token!]
        }
        return [:]
    }

}
