//
//  Trainer.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 14.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//
import ObjectMapper

class Trainer: Mappable {

    public var phone: String?
    public var email: String?
    public var isTrainer: Bool?
    public var facebookId: String?
    public var createdAt: NSDate?
    public var updatedAt: NSDate?
    public var name: String?
    public var id: Int16?
    public var images: ImagePair?

    required public init?(map: Map) {

    }

    public func mapping(map: Map) {
        phone <- map["phone"]
        email <- map["email"]
        isTrainer <- map["is_trainer"]

        facebookId <- map["facebook_id"]
        createdAt <- map["created_at"]
        updatedAt <- map["updated_at"]
        images <- map["images"]
        name <- map["name"]
        id <- map["id"]
    }

}
