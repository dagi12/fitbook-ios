//
//  Location.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 10.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import Foundation
import ObjectMapper
import MapKit

class Location: Mappable {

    var latitude: Double?
    var longtitude: Double?

    func mapping(map: Map) {
        latitude <- map["latitude"]
        longtitude <- map["longitude"]
    }

    init(coord: CLLocationCoordinate2D) {
        self.latitude = coord.latitude
        self.longtitude = coord.longitude
    }

    init(_ latitude: Double, _ longtitude: Double) {
        self.latitude = latitude
        self.longtitude = longtitude
    }

    required init?(map: Map) {
        // no need
    }

}
