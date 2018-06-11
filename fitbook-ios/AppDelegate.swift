//
//  AppDelegate.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 08.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import FacebookCore
import ErykIosCommon
import Crashlytics
import Fabric

@UIApplicationMain
class AppDelegate: ErykAppDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: LaunchOptionsCallback) -> Bool {
        initialization()
        FitbookTheme().apply()
        SDKApplicationDelegate
                .shared
                .application(application, didFinishLaunchingWithOptions: launchOptions)
        BaseUrlStore.sharedInstance.url = URL(string: "http://fitbook-api.herokuapp.com/api/")
        Fabric.with([Crashlytics.self])
        return true
    }

    // do not remove facebook login will stop working
    // swiftlint:disable all
    @available(iOS, deprecated: 9.0)
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey: Any] = [:]) -> Bool {
        return SDKApplicationDelegate.shared.application(app,
                open: url,
                sourceApplication: (options[.sourceApplication] as? String),
                annotation: options[.annotation] as Any)
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
    Crashlytics.sharedInstance().recordError(error)
}
