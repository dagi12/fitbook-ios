//
//  TrainerAlamoStore.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 14.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class TrainerStore: AlamoStore {

    static let shared = TrainerStore()

    typealias Callback = ([Trainer]) -> Void

    func getTrainers(callback: @escaping Callback) {
        let url: URLConvertible = self.constructUrl(endpoint: "v1/users/trainers")
        Alamofire.request(url,
                          method: HTTPMethod.get,
                          parameters: nil,
                          encoding: JSONEncoding.default)
            .responseArray { (response: DataResponse<[Trainer]>) in
                if response.result.isSuccess {
                    callback(response.result.value!)
                } else {
                    print(response.result.debugDescription)
                }
        }
    }

}
