//
//  AlertViewController.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 09.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import UIKit

class AlertViewHelper {

    var modalProcessing: Bool = false

    struct ProcessIndicatorCoords {
        static let xCoord = 10
        static let yCoord = 5
        static let width = 50
        static let height = 50
    }

    func showError(_ message: String, _ controller: UIViewController) {
        let alertController = UIAlertController(
                title: "error".common,
                message: message,
                preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "ok".common, style: UIAlertActionStyle.default, handler: nil))
        controller.present(alertController, animated: true, completion: nil)
    }

    func showInfo(_ message: String, _ controller: UIViewController) {
        let alertController = UIAlertController(
                title: "info".common, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "ok".common, style: UIAlertActionStyle.default, handler: nil))
        controller.present(alertController, animated: true, completion: nil)
    }

    func showProcess(_ message: String, _ controller: UIViewController) {
        if !modalProcessing {
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let frameRect = CGRect(
                    x: ProcessIndicatorCoords.xCoord, y: ProcessIndicatorCoords.yCoord,
                    width: ProcessIndicatorCoords.width, height: ProcessIndicatorCoords.height)
            let loadingIndicator = UIActivityIndicatorView(frame: frameRect)
            loadingIndicator.hidesWhenStopped = true
            loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
            loadingIndicator.startAnimating()
            alert.view.addSubview(loadingIndicator)
            controller.present(alert, animated: true, completion: nil)
            modalProcessing = true
        }

    }

    func closeProcess(controller: UIViewController) {
        if modalProcessing {
            controller.dismiss(animated: true, completion: nil)
            modalProcessing = false
        }
    }

}
