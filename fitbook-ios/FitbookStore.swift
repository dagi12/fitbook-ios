//
//  FitbookStore.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 09.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//
import RxSwift
import ErykIosCommon
import Moya_ObjectMapper

class FitbookStore: BaseTokenStore<FitbookApi> {

    static let shared = FitbookStore()

    func login(token: FacebookToken) -> Single<FitbookLoginResult> {
        return provider.rx
            .request(.login(token))
            .mapObject(FitbookLoginResult.self)
    }

    func refresh() -> Single<FitbookLoginResult> {
        return provider.rx
            .request(.refresh)
            .mapObject(FitbookLoginResult.self)
    }

}
