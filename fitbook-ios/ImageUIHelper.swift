//
//  ImageUIHelper.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 10.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import UIKit
import Kingfisher

class ImageUIHelper {

    static let shared = ImageUIHelper()

    func setRoundedImage(imageView: UIImageView) {
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
    }

    func setImageCellReload(cell: UITableViewCell, url: String, indexPath: IndexPath, tableView: UITableView) {
        cell.imageView?.kf.setImage(
            with: URL(string: url),
            placeholder: nil,
            options: nil,
            progressBlock: nil,
            completionHandler: {(_, _, _, _) -> Void in
                tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            }
        )
    }
}
