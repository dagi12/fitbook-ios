//
//  MoreViewController.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 10.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import UIKit
import Kingfisher

class MoreViewController: UITableViewController {

    let userHelper = UserHelper.shared
    let imageHelper = ImageUIHelper.shared
    let fitbookStringHelper = FitbookStringHelper.shared

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var role: UILabel!
    @IBAction func logOutClick(_ sender: UIButton) {
        if let viewController = self.tabBarController as? ViewController {
            viewController.logoutFromMore()
        }
    }

    private func setImage() {
        if let picture = userHelper.getUser()?.images?.picture {
            self.profileImage.kf.setImage(with: URL(string: picture))
        }
    }

    private func setUserLabels() {
        if let user = userHelper.getUser() {
            role.text = fitbookStringHelper.getRole(isTrainer: user.isTrainer!)
            username.text = user.name
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        imageHelper.setRoundedImage(imageView: self.profileImage)
        setImage()
        setUserLabels()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }

}
