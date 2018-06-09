//
//  TrainerAlamoStore.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 14.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//
import RxSwift
import ErykIosCommon
import Moya_ObjectMapper

class TrainerStore: BaseTokenStore<TrainerApi> {

    static let shared = TrainerStore()

    func getTrainers()-> Single<[Trainer]> {
        return provider.rx
            .request(.trainers)
            .mapArray(Trainer.self)
    }

}
