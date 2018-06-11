//
//  User+CoreDataProperties.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 11.06.2018.
//  Copyright © 2018 Eryk Mariankowski. All rights reserved.
//
//

import Foundation
import CoreData

extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var phone: String?
    @NSManaged public var email: String?
    @NSManaged public var isTrainer: Bool
    @NSManaged public var facebookId: String?
    @NSManaged public var createdAt: NSDate?
    @NSManaged public var updatedAt: NSDate?
    @NSManaged public var name: String?
    @NSManaged public var id: Int16
    @NSManaged public var images: ImagePair?

}
