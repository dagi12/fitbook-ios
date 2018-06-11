//
//  ViewController.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 08.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import FacebookLogin
import ErykIosCommon

class ViewController: UITabBarController, LogoutDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        Router.sharedInstance.logoutDelegate = self
    }

    func logout() {
        let index = 0
        self.selectedIndex = index
        let viewController = self.viewControllers?[index] as? MapViewController
        viewController?.fitbookLogout(true)
    }

}
