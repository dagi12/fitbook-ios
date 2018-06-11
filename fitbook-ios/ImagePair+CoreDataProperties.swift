//
//  ImagePair+CoreDataProperties.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 11.06.2018.
//  Copyright © 2018 Eryk Mariankowski. All rights reserved.
//
//

import Foundation
import CoreData

extension ImagePair {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ImagePair> {
        return NSFetchRequest<ImagePair>(entityName: "ImagePair")
    }

    @NSManaged public var id: Int16
    @NSManaged public var cover: Int16
    @NSManaged public var picture: String?

}
