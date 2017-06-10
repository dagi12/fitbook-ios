//
//  GymService.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 10.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import SwiftyJSON

class GymAlamoService: AlamoService {

    static let shared = GymAlamoService()
    typealias Callback = ([Gym]) -> Void

    func searchByLocation(parameters: GymRequestParameters, callback : @escaping Callback) {
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

}
