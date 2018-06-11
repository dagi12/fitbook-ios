//
//  FitbookLoginResult+CoreDataClass.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 11.06.2018.
//  Copyright © 2018 Eryk Mariankowski. All rights reserved.
//
//

import CoreData
import ObjectMapper

public class FitbookLoginResult: NSManagedObject, Mappable {

    override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    required public init?(map: Map) {
        let ctx = NSManagedObjectContext.defaultContext
        let entity = NSEntityDescription.entity(forEntityName: "FitbookLoginResult", in: ctx)
        super.init(entity: entity!, insertInto: ctx)
        mapping(map: map)
    }

    public func mapping(map: Map) {
        token <- map["token"]
        user <- map["user"]
        exp <- map["exp"]
        iss <- map["iss"]
    }

}
