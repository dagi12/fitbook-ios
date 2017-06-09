//
//  FitbookAlamoService.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 09.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class FitbookAlamoService: AlamoService {
    
    typealias Callback = (FitbookLoginResult) -> Void
    
    func login(token: FacebookToken, callback : @escaping Callback) {
        let url: URLConvertible = self.constructUrl(endpoint: "auth/facebook")
        let parameters: Parameters? = token.toJSON()
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseObject { (response: DataResponse<FitbookLoginResult>) in
                callback(response.result.value!)
        }
    }
    
}
