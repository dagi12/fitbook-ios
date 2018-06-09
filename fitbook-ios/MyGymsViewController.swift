//
//  MyGymsViewController.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 11.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//
import UIKit
import Kingfisher
import ErykIosCommon

class MyGymsViewController: UITableViewController {

    private let gymStore = GymAlamoStore.shared
    private var gyms: [Gym] = []

    private func gymStoreCallback() -> GymAlamoStore.Callback {
        return { (result: [Gym]) in
            self.gyms = result
            self.tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gyms.count
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyGymCell", for: indexPath)
        let gym = gyms[indexPath.row]
        cell.textLabel?.text = gym.name
        cell.imageView!.image = UIImage(named: "Gym")
        if let picture = gym.images?.picture {
            cell.imageReload(url: picture, indexPath: indexPath, tableView: tableView)
        }
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        gymStore.myGyms(callback: gymStoreCallback())
    }

}
