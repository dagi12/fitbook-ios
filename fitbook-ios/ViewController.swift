//
//  ViewController.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 08.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import Foundation
import FacebookLogin

class ViewController: UITabBarController {

    func logoutFromMore() {
        let index = 0
        self.selectedIndex = index
        let viewController = self.viewControllers?[index] as? MapViewController
        viewController?.fitbookLogout(true)
    }

}
