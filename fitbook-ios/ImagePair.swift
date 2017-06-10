//
//  ImagePair.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 09.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import Foundation
import ObjectMapper

@objc(ImagePair)
class ImagePair: NSObject, NSCoding, Mappable {

    var identifier: Int?
    var cover: String?
    var picture: String?

    required init?(map: Map) {

    }

    required init?(coder aDecoder: NSCoder) {
        self.cover = aDecoder.decodeObject(forKey: "cover") as? String
        self.picture = aDecoder.decodeObject(forKey: "picture") as? String
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(cover, forKey: "cover")
        aCoder.encode(picture, forKey: "picture")
    }

    func mapping(map: Map) {
        identifier <- map["id"]
        cover <- map["cover"]
        picture <- map["picture"]
    }

}
