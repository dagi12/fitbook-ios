//
//  AlertViewController.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 09.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import UIKit

class AlertViewService {
    
    static let sharedInstance = AlertViewService()

    func showError(_ message: String, _ controller: UIViewController) {
        let alertController = UIAlertController(title: "Błąd", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
        controller.present(alertController, animated: true, completion: nil)
    }
    
    func showInfo(_ message: String, _ controller: UIViewController) {
        let alertController = UIAlertController(title: "Info", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default,handler: nil))
        controller.present(alertController, animated: true, completion: nil)
    }

}
