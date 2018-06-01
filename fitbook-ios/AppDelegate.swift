//
//  AppDelegate.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 08.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import Foundation
import FacebookCore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    typealias LaunchOptionsCallback = ([UIApplicationLaunchOptionsKey: Any]?)
    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: LaunchOptionsCallback) -> Bool {
        SDKApplicationDelegate
                .shared
                .application(application, didFinishLaunchingWithOptions: launchOptions)
        return true
    }
    
    // swiftlint:disable all
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        return SDKApplicationDelegate.shared.application(app,
                                                         open: url,
                                                         sourceApplication: (options[.sourceApplication] as? String),
                                                         annotation: options[.annotation])
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
