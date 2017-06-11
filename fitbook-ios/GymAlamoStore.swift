//
//  GymAlamoStore.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 10.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper
import SwiftyJSON

class GymAlamoStore: AlamoStore {

    static let shared = GymAlamoStore()
    typealias Callback = ([Gym]) -> Void

    func searchByLocation(parameters: GymRequestParameters, callback: @escaping Callback) {
        let url: URLConvertible = self.constructUrl(endpoint: "v1/gyms/find")
        let parameters: Parameters? = parameters.toJSON()
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
                .responseArray { (response: DataResponse<[Gym]>) in
                    if response.result.isSuccess {
                        callback(response.result.value!)
                    } else {
                        print(response.result.debugDescription)
                    }
                }
    }

    func myGyms(callback: @escaping Callback) {
        let url: URLConvertible = self.constructUrl(endpoint: "v1/me/gyms")
        Alamofire.request(
            url, method: HTTPMethod.get, parameters: nil,
            encoding: JSONEncoding.default, headers: getHeader())
            .responseArray { (response: DataResponse<[GymJoinResilt]>) in
                if response.result.isSuccess {
                    var gyms: [Gym] = []
                    for gymJoin in response.result.value! {
                        gyms.append(gymJoin.gym!)
                    }
                    callback(gyms)
                } else {
                    print(response.result.debugDescription)
                }
        }
    }

}
