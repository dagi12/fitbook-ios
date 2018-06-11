//
//  File.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 10.06.2018.
//  Copyright © 2018 Eryk Mariankowski. All rights reserved.
//

import Swinject
import SwinjectStoryboard
import SwinjectAutoregistration

extension SwinjectStoryboard {

    @objc class func setup() {
        defaultContainer
            .autoregister(UserDefaultsStore.self, initializer: UserDefaultsStore.init)
            .inObjectScope(.container)
        defaultContainer
            .autoregister(AlertViewHelper.self, initializer: AlertViewHelper.init)
            .inObjectScope(.container)
        defaultContainer
            .autoregister(GymStore.self, initializer: GymStore.init)
            .inObjectScope(.container)
        defaultContainer
            .autoregister(UserHelper.self, initializer: UserHelper.init)
            .inObjectScope(.container)
        defaultContainer
            .autoregister(TrainerStore.self, initializer: TrainerStore.init)
            .inObjectScope(.container)
        defaultContainer
            .autoregister(FitbookLoginViewModel.self, initializer: FitbookLoginViewModel.init)
            .inObjectScope(.container)
        defaultContainer
            .autoregister(FitbookStore.self, initializer: FitbookStore.init)
            .inObjectScope(.container)

        defaultContainer.storyboardInitCompleted(MyGymsViewController.self) { res, con in
            con.gymStore = res.resolve(GymStore.self)
        }
        defaultContainer.storyboardInitCompleted(MoreViewController.self) { res, con in
            con.userHelper = res.resolve(UserHelper.self)
        }
        defaultContainer.storyboardInitCompleted(TrainerViewController.self) { res, con in
            con.trainerStore = res.resolve(TrainerStore.self)
        }
        defaultContainer.storyboardInitCompleted(MapViewController.self) { res, con in
            con.alertHelper = res.resolve(AlertViewHelper.self)
            con.fitbookStore = res.resolve(FitbookLoginViewModel.self)
            con.gymStore = res.resolve(GymStore.self)
        }
    }

}
