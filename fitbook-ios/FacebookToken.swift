//
//  FacebookToken.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 09.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import ObjectMapper

class FacebookToken: Mappable {
    var token: String?

    init(token: String) {
        self.token = token
    }

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        token <- map["token"]
    }

}
