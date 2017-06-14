//
//  FitbookAlamoStore.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 09.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class FitbookAlamoStore: AlamoStore {

    static let shared = FitbookAlamoStore()
    typealias Callback = (FitbookLoginResult) -> Void

    func login(token: FacebookToken, callback: @escaping Callback) {
        let url: URLConvertible = self.constructUrl(endpoint: "auth/facebook")
        let parameters: Parameters? = token.toJSON()
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
                .responseObject { (response: DataResponse<FitbookLoginResult>) in
                    if response.result.isSuccess {
                        callback(response.result.value!)
                    } else {
                        print(response.result.debugDescription)
                    }
                }
    }

    func refresh(callback: @escaping Callback) {
        let url: URLConvertible = self.constructUrl(endpoint: "auth/refresh")
        Alamofire.request(url, method: .put, parameters: nil, encoding: JSONEncoding.default, headers: getHeader())
            .responseObject { (response: DataResponse<FitbookLoginResult>) in
                if response.result.isSuccess {
                    callback(response.result.value!)
                } else {
                    print(response.result.debugDescription)
                }
        }
    }

}
