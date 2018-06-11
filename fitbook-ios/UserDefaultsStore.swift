//
//  UserDefaultsStore.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 09.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import ErykIosCommon
import CoreData

class UserDefaultsStore {

    func setFitbookResult(fitbookResult: FitbookLoginResult) {
        _ = removeFitbookResult(for: fitbookResult.objectID)
        let context = NSManagedObjectContext.defaultContext
        context.insert(fitbookResult.user!)
        context.insert(fitbookResult)
        try? context.save()
    }

    func removeFitbookResult(for id: NSManagedObjectID? = nil) -> NSManagedObjectContext? {
        let context = NSManagedObjectContext.defaultContext
        if let array = try? context.fetch(FitbookLoginResult.fetchRequest()) {
            for res in array {
                let loginResult = res as! FitbookLoginResult
                if !loginResult.objectID.isEqual(id) {
                    context.delete(loginResult)
                }
            }
            try? context.save()
            return context
        }
        return nil
    }

    func getFitbookResult() -> FitbookLoginResult? {
        if let result = fitbookResultFromCoreData() as? FitbookLoginResult {
            BaseUrlStore.sharedInstance.token = result.token
            return result
        }
        return nil
    }

    func fitbookResultFromCoreData() -> NSManagedObject? {
        if let result = try? NSManagedObjectContext.defaultContext.fetch(FitbookLoginResult.fetchRequest()) {
            assert(result.count < 2)
            if (result.count == 1) {
                 return result[0] as? NSManagedObject
            }
        }
        return nil
    }

}

public extension NSManagedObjectContext {

    public static var defaultContext: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }

}
