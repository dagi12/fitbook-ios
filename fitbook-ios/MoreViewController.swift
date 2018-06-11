//
//  MoreViewController.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 10.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import Kingfisher
import ErykIosCommon

class MoreViewController: UITableViewController {

    var userHelper: UserHelper!

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var role: UILabel!
    @IBAction func logOutClick(_ sender: UIButton) {
        if let viewController = self.tabBarController as? MyTabBarController {
            viewController.logout()
        }
    }

    private func setImage() {
        if let picture = userHelper.getUser()?.images?.picture {
            self.profileImage.kf.setImage(with: URL(string: picture))
        }
    }

    private func setUserLabels() {
        if let user = userHelper.getUser() {
            role.text = MoreViewController.roleLabel(isTrainer: user.isTrainer!)
            username.text = user.name
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.profileImage.rounded()
        setImage()
        setUserLabels()
    }

    static func roleLabel(isTrainer: Bool) -> String {
        if isTrainer {
            return "Trainer"
        }
        return "User"
    }

}
