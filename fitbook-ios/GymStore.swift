//
//  GymAlamoStore.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 10.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//
import RxSwift
import ErykIosCommon
import Moya_ObjectMapper

class GymStore: BaseTokenStore<GymApi> {

    static let shared = GymStore()

    func searchByLocation(parameters: GymRequestParameters) -> Single<[Gym]> {
        return provider.rx.request(.searchByLocation(parameters)).mapArray(Gym.self)
    }

    func myGyms() -> Single<[Gym]> {
        return provider.rx.request(.myGyms)
            .mapArray(GymJoinResult.self)
            .map { $0.map {
                $0.gym!
            }
        }
    }

}
