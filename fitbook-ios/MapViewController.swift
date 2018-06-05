//
//  MapViewController.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 09.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import Foundation
import FacebookLogin
import MapKit

struct FacebookButtonCoords {
    static let marginBottom = CGFloat(120)
    static let width = CGFloat(302)
    static let height = CGFloat(43)
}

class MapViewController: UIViewController, FacebookLoginResultDelegate, FitbookLoginDelegate {

    private var loginDelegate: LoginButtonDelegate?
    private let mapKitHelper = MapKitHelper()
    private var initialTabBarViewControllers: [UIViewController]?
    private let loginButton: LoginButton = LoginButton(readPermissions: [.publicProfile, .email])
    private let alertHelper = AlertViewHelper.shared
    private let fitbookStore = FitbookLoginStore.shared
    private let processingMessage = "Signing in..."
    private let gymStore = GymAlamoStore.shared

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var facebookView: UIView!

    func gymStoreCallback() -> GymAlamoStore.Callback {
        return { ( result: [Gym]) in
            for gym in result {
                if let anno = gym.getAnnotation() {
                    self.mapView.addAnnotation(anno)
                }
            }
            self.mapKitHelper.stopUpdating(mapView: self.mapView)
        }
    }

    @IBAction func findCloseGym(_ sender: UIButton) {
        let parameters = mapKitHelper.getLocationRequest(mapView: mapView)
        gymStore.searchByLocation(
                parameters: parameters, callback: gymStoreCallback())
    }

    func facebookLoginSuccess() {
        alertHelper.showProcess(processingMessage, self)
        fitbookStore.fitbookLoginAfterFacebookSuccess(loginDelegate: self)
    }

    func facebookLoginFailed() {
        alertHelper.showError("Facebook login has been cancelled", self)
    }

    func fitbookLogin() {
        loginButton.isHidden = true
        restoreLoggedTabs()
        alertHelper.closeProcess(controller: self)

    }

    func restoreLoggedTabs() {
        self.tabBarController?.viewControllers = initialTabBarViewControllers
    }

    func removeLoggedTabs() {
        if let tabBarController = self.tabBarController {
            if let viewControllers = tabBarController.viewControllers {
                let lenCondition = 4
                if lenCondition < viewControllers.count {
                    var viewControllers = tabBarController.viewControllers
                    viewControllers?.remove(at: 4)
                    viewControllers?.remove(at: 3)
                    tabBarController.viewControllers = viewControllers
                }
            }
        }
    }

    func fitbookLogout(_ manual: Bool?) {
        if manual ?? false {
            alertHelper.showInfo("Logged out", self)
            LoginManager().logOut()
            fitbookStore.manualLogout()
        }
        loginButton.isHidden = false
        removeLoggedTabs()
        if manual ?? true {
            alertHelper.closeProcess(controller: self)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loginDelegate = FacebookLoginStore(loginDelegate: self)
        loginButton.delegate = loginDelegate
        loginButton.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        loginButton.frame.size.width = facebookView.frame.width
        loginButton.frame.size.height = facebookView.frame.height

        facebookView.addSubview(loginButton)
        alertHelper.showProcess(processingMessage, self)
        self.initialTabBarViewControllers = self.tabBarController?.viewControllers
        fitbookStore.checkLogin(loginDelegate: self)
        mapKitHelper.initMap(mapView: mapView)
    }

}
