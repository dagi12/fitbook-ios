//
//  TrainerApi.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 09.06.2018.
//  Copyright © 2018 Eryk Mariankowski. All rights reserved.
//

import Foundation
import Moya
import ErykIosCommon

enum TrainerApi {
    case trainers
}

extension TrainerApi: BaseTargetType, AccessTokenAuthorizable {

    var path: String {
        switch self {
        case .trainers:
            return "v1/users/trainers"
        }
    }

    var method: Moya.Method {
        switch self {
        case .trainers:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .trainers:
            return .requestPlain
        }
    }

    var authorizationType: AuthorizationType {
        switch self {
        case .trainers:
            return .none
        }
    }

}
