//
//  AppDelegate.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 08.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import Foundation
import FacebookCore
import ErykIosCommon

@UIApplicationMain
class AppDelegate: ErykAppDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: LaunchOptionsCallback) -> Bool {
        initialization()
        SDKApplicationDelegate
                .shared
                .application(application, didFinishLaunchingWithOptions: launchOptions)
        BaseUrlStore.sharedInstance.url = URL(string: "http://fitbook-api.herokuapp.com/api/")
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {

    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        AppEventsLogger.activate(application)
    }

    func applicationWillTerminate(_ application: UIApplication) {

    }

}

func logError(_ error: Error) {
    log.error(error.localizedDescription)
//    Crashlytics.sharedInstance().recordError(error)
}
