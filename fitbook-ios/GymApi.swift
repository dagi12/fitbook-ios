//
//  GymApi.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 09.06.2018.
//  Copyright © 2018 Eryk Mariankowski. All rights reserved.
//

import ErykIosCommon
import Moya

enum GymApi {
    case searchByLocation(GymRequestParameters)
    case myGyms
}

extension GymApi: BaseTargetType, AccessTokenAuthorizable {

    var method: Moya.Method {
        switch self {
        case .myGyms:
            return .get
        case .searchByLocation:
            return .post
        }
    }

    var path: String {
        switch self {
        case .myGyms:
            return "v1/me/gyms"
        case .searchByLocation:
            return "v1/gyms/find"
        }
    }

    var task: Task {
        switch self {
        case .searchByLocation(let request):
            return .requestParameters(parameters: request.toJSON(), encoding: JSONEncoding.default)
        default:
            return .requestPlain
        }
    }

    var authorizationType: AuthorizationType {
        switch self {
        case .myGyms:
            return .bearer
        case .searchByLocation:
            return .none
        }
    }

}
