//
//  ImagePair.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 09.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import Foundation
import ObjectMapper

struct ImagePair: Mappable {
    
    var id: Int?
    var cover: String?
    var picture: String?
   
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        cover <- map["cover"]
        picture <- map["picture"]
    }
    
}
