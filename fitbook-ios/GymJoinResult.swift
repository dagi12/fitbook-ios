//
//  File.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 11.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import ObjectMapper

class GymJoinResult: Mappable {

    var approved: Bool?
    var gym: Gym?
    var since: Date?

    func mapping(map: Map) {
        approved <- map["approved"]
        gym <- map["gym"]
        since <- map["since"]
    }

    required init?(map: Map) {
        // no need
    }
}
