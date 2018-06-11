//
//  User+CoreDataClass.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 11.06.2018.
//  Copyright © 2018 Eryk Mariankowski. All rights reserved.
//
//

import ObjectMapper
import CoreData

public class User: NSManagedObject, Mappable {

    override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    required public init?(map: Map) {
        let ctx = NSManagedObjectContext.defaultContext
        let entity = NSEntityDescription.entity(forEntityName: "User", in: ctx)
        super.init(entity: entity!, insertInto: ctx)
        mapping(map: map)
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
