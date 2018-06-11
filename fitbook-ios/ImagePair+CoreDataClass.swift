//
//  ImagePair+CoreDataClass.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 11.06.2018.
//  Copyright © 2018 Eryk Mariankowski. All rights reserved.
//
//

import ObjectMapper
import CoreData

public class ImagePair: NSManagedObject, Mappable {

    override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    required public init?(map: Map) {
        let ctx = NSManagedObjectContext.defaultContext
        let entity = NSEntityDescription.entity(forEntityName: "ImagePair", in: ctx)
        super.init(entity: entity!, insertInto: ctx)
        mapping(map: map)
    }
    public func mapping(map: Map) {
        id <- map["id"]
        cover <- map["cover"]
        picture <- map["picture"]
    }

}
