//
//  MoreViewController.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 10.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import UIKit

class MoreViewController: UITableViewController {

    @IBAction func logOutClick(_ sender: UIButton) {
        let viewController = self.tabBarController as? ViewController
        if viewController != nil {
            viewController?.logoutFromMore()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
