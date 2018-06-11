//
//  FitbookLoginResult+CoreDataProperties.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 11.06.2018.
//  Copyright © 2018 Eryk Mariankowski. All rights reserved.
//
//

import Foundation
import CoreData

extension FitbookLoginResult {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FitbookLoginResult> {
        return NSFetchRequest<FitbookLoginResult>(entityName: "FitbookLoginResult")
    }

    @NSManaged public var token: String?
    @NSManaged public var exp: Int32
    @NSManaged public var iss: Int32
    @NSManaged public var user: User?

}
