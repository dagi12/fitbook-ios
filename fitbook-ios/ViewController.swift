//
//  ViewController.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 08.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import UIKit
import FacebookLogin

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func logoutFromMore() {
        let index = 0
        self.selectedIndex = index
        let viewController = self.viewControllers?[index] as? MapViewController
        viewController?.fitbookLogout(true)
    }

}
