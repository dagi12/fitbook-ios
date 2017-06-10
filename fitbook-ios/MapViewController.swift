//
//  MapViewController.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 09.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import UIKit
import FacebookLogin

struct FacebookButtonCoords {
    static let marginBottom = CGFloat(60)
    static let width = CGFloat(250)
    static let height = CGFloat(40)
}

class MapViewController: UIViewController, FacebookLoginResultProtocol, FitbookLoginProtocol {

    var loginDelegate: LoginButtonDelegate?
    let loginButton: LoginButton = LoginButton(readPermissions: [ .publicProfile, .email ])
    let alertService = AlertViewService.sharedInstance
    let fitbookService = FitbookLoginService.shared
    let processingMessage = "Signing in..."

    func facebookLoginSuccess() {
        alertService.showProcess(processingMessage, self)
        fitbookService.fitbookLoginAfterFacebookSuccess(loginProtocol: self)
    }

    func facebookLoginFailed() {
        alertService.showError("Facebook login has been cancelled", self)
    }

    func facebookLogout() {
        alertService.showInfo("Logged out", self)
    }

    func fitbookLogin() {
        loginButton.isHidden = true
        alertService.closeProcess(controller: self)

    }

    func fitbookLogout() {
        loginButton.isHidden = false
        alertService.closeProcess(controller: self)
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

    override func viewDidLoad() {
        super.viewDidLoad()
        alertService.showProcess(processingMessage, self)
        view.addSubview(setLoginButton())
        fitbookService.checkLogin(loginProtocol: self)
    }

}
