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
import CoreData

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
        self.saveContext()
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "fitbook-ios")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

func logError(_ error: Error) {
    log.error(error.localizedDescription)
    Crashlytics.sharedInstance().recordError(error)
}
