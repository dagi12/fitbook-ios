//
//  Trainer.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 14.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//
import ObjectMapper

class Trainer: User {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    required init?(map: Map) {
        super.init(map: map)
    }

}
