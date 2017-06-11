//
//  Gym.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 10.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import ObjectMapper
import MapKit

class Gym: Mappable {

    var identifier: Int?
    var about: String?
    var description: String?
    var webstite: String?
    var images: ImagePair?
    var name: String?
    var location: Location?

    func mapping(map: Map) {
        images <- map["images"]
        identifier <- map["id"]
        name <- map["name"]
        about <- map["about"]
        description <- map["description"]
        webstite <- map["website"]
        location <- map["location"]
    }

    func getAnnotation() -> MKPointAnnotation? {
        if location != nil && location!.longtitude != nil && name != nil {
            let coord = CLLocationCoordinate2D(latitude: location!.latitude!, longitude: location!.longtitude!)
            let anno = MKPointAnnotation()
            anno.coordinate = coord
            anno.title = name
            return anno
        }
        return nil
    }

    required init?(map: Map) {
        // no need
    }

}
