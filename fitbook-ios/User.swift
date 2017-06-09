//
//  User.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 09.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import Foundation
import ObjectMapper

class User: Mappable {
    
    var phone: String?
    var email: String?
    var isTrainer: Bool?
    
    var facebookId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var images: ImagePair?
    var name: String?
    var id: Int?
    

    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        phone <- map["phone"]
        email <- map["email"]
        isTrainer <- map["trainer"]
        
        facebookId <- map["facebookId"]
        createdAt <- map["createdAt"]
        updatedAt <- map["updatedAt"]
        images <- map["images"]
        name <- map["name"]
        id <- map["id"]
    }
    
}
