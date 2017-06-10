//
//  GymRequestParameters.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 10.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import Foundation
import ObjectMapper

class GymRequestParameters: Mappable {

    var location: LocationRequest?

    func mapping(map: Map) {
        location <- map["location"]
    }

    init(_ location: LocationRequest) {
        self.location = location
    }

    required init?(map: Map) {
        // no need
    }
}
