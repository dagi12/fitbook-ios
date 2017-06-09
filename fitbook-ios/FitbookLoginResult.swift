//
//  FitbookLoginResult.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 09.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//
import ObjectMapper

class FitbookLoginResult : Mappable{
    
    var token: String?
    var user: User?
    var exp: Int?
    var iss: Int?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        token <- map["token"]
        user <- map["user"]
        exp <- map["exp"]
        iss <- map["iss"]
    }
}
