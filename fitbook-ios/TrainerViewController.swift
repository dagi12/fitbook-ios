//
//  TrainerViewController.swift
//  fitbook-ios
//
//  Created by Eryk Mariankowski on 09.06.2017.
//  Copyright © 2017 Eryk Mariankowski. All rights reserved.
//

import UIKit
import ErykIosCommon
import RxSwift

class TrainerViewController: UITableViewController {

    private let trainerStore = TrainerStore.shared
    private var trainers: [Trainer] = []

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trainers.count
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrainerCell", for: indexPath)
        let trainer = trainers[indexPath.row]
        cell.textLabel?.text = trainer.name
        cell.imageView!.image = UIImage(named: "Trainer")
        if let picture = trainer.images?.picture {
            cell.imageReload(url: picture, indexPath: indexPath, tableView: tableView)
        }
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        trainerStore
            .getTrainers()
            .subscribe(onSuccess: {
            self.trainers = $0
            self.tableView.reloadData()
        }).disposed(by: bag)
    }

    private let bag = DisposeBag()

}
