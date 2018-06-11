//
//  FItbookLoginViewModelTest.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 11.06.2018.
//  Copyright © 2018 Eryk Mariankowski. All rights reserved.
//
import Foundation

import Quick
import Nimble
import RxBlocking
@testable import XCGLogger
@testable import Alamofire
@testable import FitBook
@testable import FacebookCore
@testable import Swinject
@testable import SwinjectAutoregistration
@testable import SwinjectStoryboard

class FitbookLoginViewModelTest: QuickSpec {
    
    override func spec() {
        describe("FitbookLoginViewModelTest") {
            it("should download and parse login") {
                let defaultContainer = SwinjectStoryboard.defaultContainer
                defaultContainer.register(FitbookStore.self) { _ in FitbookStore() }
                defaultContainer.register(UserDefaultsStore.self) {_ in UserDefaultsStore() }
                defaultContainer.register(UserHelper.self) { r in
                    let store = r.resolve(UserDefaultsStore.self)!
                    return UserHelper(defaultsStore: store)
                }
                defaultContainer.register(FitbookLoginViewModel.self) {r in
                    let store = r.resolve(FitbookStore.self)!
                    let helper = r.resolve(UserHelper.self)!
                    return FitbookLoginViewModel(userHelper: helper, fitbookStore: store)
                }
                let viewModel = SwinjectStoryboard.defaultContainer.resolve(FitbookLoginViewModel.self)!
                AccessToken.current = AccessToken(appId: SDKSettings.appId, authenticationToken: "EAAcspbf8aqcBAIx1txws6RZA5v2WSxO8S2ZAhCZCF4QLole1BVrlgtzcAd6UU2QJvQedxZCtmSkZCWXtZCxfvY18Yo9APppslrZCVaGvPdcyRfdg1WkAUrStZCnsqXkXO50knTZAQxQIpLAuTXppZAveG7GDYcuQ23z8jSbwfovkf63owBrJhhWNrbqVSHTUYkwITXbm43rgLu5QVxb5HWuhIsqB2vCBYaZAxTk8KZADacOwuQZDZD")
                do {
                    let _ = try
                        viewModel
                            .fitbookLoginAfterFacebookSuccess()
                            .toBlocking()
                            .first()
                } catch let error {
                    fail(error.localizedDescription)
                }
            }
        }
    }
    
}


