//
//  MapViewController.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 09.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import UIKit
import FacebookLogin
import MapKit

struct FacebookButtonCoords {
    static let marginBottom = CGFloat(60)
    static let width = CGFloat(250)
    static let height = CGFloat(40)
}

class MapViewController: UIViewController, FacebookLoginResultProtocol, FitbookLoginProtocol {

    private var loginDelegate: LoginButtonDelegate?
    private let mapKitDelegate = MapKitDelegate()
    private var initialTabBarViewControllers: [UIViewController]?
    private let loginButton: LoginButton = LoginButton(readPermissions: [ .publicProfile, .email ])
    private let alertService = AlertViewService.sharedInstance
    private let fitbookService = FitbookLoginService.shared
    private let processingMessage = "Signing in..."
    @IBOutlet weak var mapView: MKMapView!

    func facebookLoginSuccess() {
        alertService.showProcess(processingMessage, self)
        fitbookService.fitbookLoginAfterFacebookSuccess(loginProtocol: self)
    }

    func facebookLoginFailed() {
        alertService.showError("Facebook login has been cancelled", self)
    }

    func fitbookLogin() {
        loginButton.isHidden = true
        restoreLoggedTabs()
        alertService.closeProcess(controller: self)

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
            alertService.showInfo("Logged out", self)
            LoginManager().logOut()
        }
        loginButton.isHidden = false
        removeLoggedTabs()
        if manual ?? true {
            alertService.closeProcess(controller: self)
        }
    }

    func setLoginButton() -> LoginButton {
        let frameHeight = UIScreen.main.bounds.height
        let buttonHeight = loginButton.frame.height
        let yCoord = frameHeight - buttonHeight - FacebookButtonCoords.marginBottom
        var loginButtonFrame = loginButton.frame
        loginButtonFrame.size.width = FacebookButtonCoords.width
        loginButtonFrame.size.height = FacebookButtonCoords.height
        loginButton.frame = loginButtonFrame
        loginButton.center = CGPoint(x: view.center.x, y: yCoord)
        loginDelegate = FacebookLoginService(loginResultProtocol: self)
        loginButton.delegate = loginDelegate
        return loginButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        mapKitDelegate.initMap(mapView: mapView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        alertService.showProcess(processingMessage, self)
        view.addSubview(setLoginButton())
        self.initialTabBarViewControllers = self.tabBarController?.viewControllers
        fitbookService.checkLogin(loginProtocol: self)
    }

}
