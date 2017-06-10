//
//  User.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 09.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import Foundation
import ObjectMapper

@objc(User)
class User: NSObject, NSCoding, Mappable {

    var phone: String?
    var email: String?
    var isTrainer: Bool?

    var facebookId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var images: ImagePair?
    var name: String?
    var identifier: Int?

    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(identifier, forKey: "id")
        aCoder.encode(images, forKey: "images")
        aCoder.encode(email, forKey: "email")
        aCoder.encode(isTrainer, forKey: "is_trainer")
    }

    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "name") as? String
        self.email = aDecoder.decodeObject(forKey: "email") as? String
        self.images = aDecoder.decodeObject(forKey: "images") as? ImagePair
        self.identifier = aDecoder.decodeObject(forKey: "id") as? Int
        self.isTrainer = aDecoder.decodeObject(forKey: "is_trainer") as? Bool
    }

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        phone <- map["phone"]
        email <- map["email"]
        isTrainer <- map["is_trainer"]

        facebookId <- map["facebook_id"]
        createdAt <- map["created_at"]
        updatedAt <- map["updated_at"]
        images <- map["images"]
        name <- map["name"]
        identifier <- map["id"]
    }

}
