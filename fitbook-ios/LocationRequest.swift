//
//  LocationRequest.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 10.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import Foundation
import ObjectMapper

class LocationRequest: Mappable {

    var topLeft: Location?
    var bottomRight: Location?

    func mapping(map: Map) {
        topLeft <- map["top_left"]
        bottomRight <- map["bottom_right"]
    }

    init(_ topLeft: Location, _ bottomRight: Location) {
        self.topLeft = topLeft
        self.bottomRight = bottomRight
    }

    required init?(map: Map) {
        // no need
    }
}
