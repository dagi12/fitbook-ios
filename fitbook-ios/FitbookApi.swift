//
//  FitbookApi.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 09.06.2018.
//  Copyright © 2018 Eryk Mariankowski. All rights reserved.
//

import Foundation
import Moya
import ErykIosCommon

enum FitbookApi {
    case login(FacebookToken)
    case refresh
}

extension FitbookApi: BaseTargetType, AccessTokenAuthorizable {

    var path: String {
        switch self {
        case .login:
            return "auth/facebook"
        case .refresh:
            return "auth/refresh"
        }
    }

    var method: Moya.Method {
        switch self {
        case .login:
            return .post
        case .refresh:
            return .put
        }
    }

    var task: Task {
        switch self {
        case .login(let token):
            return .requestParameters(parameters: token.toJSON(), encoding: JSONEncoding.default)
        default:
            return .requestPlain
        }
    }

    var authorizationType: AuthorizationType {
        switch self {
        case .login:
            return .none
        case .refresh:
            return .bearer
        }
    }

}
