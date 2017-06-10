//
//  FitbookLoginResult.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 09.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import ObjectMapper

@objc(FitbookLoginResult)
class FitbookLoginResult: NSObject, NSCoding, Mappable {

    var token: String?
    var user: User?
    var exp: Int?
    var iss: Int?

    required init?(map: Map) {

    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(token, forKey: "token")
        aCoder.encode(user, forKey: "user")
        aCoder.encode(exp, forKey: "exp")
        aCoder.encode(iss, forKey: "iss")
    }

    required init?(coder aDecoder: NSCoder) {
        self.token = aDecoder.decodeObject(forKey: "token") as? String
        self.user = aDecoder.decodeObject(forKey: "user") as? User
        self.exp = aDecoder.decodeObject(forKey: "exp") as? Int
        self.iss = aDecoder.decodeObject(forKey: "iss") as? Int
    }

    func mapping(map: Map) {
        token <- map["token"]
        user <- map["user"]
        exp <- map["exp"]
        iss <- map["iss"]
    }
}
