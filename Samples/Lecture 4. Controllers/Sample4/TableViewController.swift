//
//  TableViewController.swift
//  Sample4
//
//  Created by Denis Malykh on 21.03.18.
//  Copyright © 2018 Yandex. All rights reserved.
//

import UIKit

class TableViewController : UIViewController {

    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            //tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellStyle)
            tableView.register(UINib(nibName: "CustomCell", bundle: Bundle.main), forCellReuseIdentifier: CustomCell.identifier)

            tableView.estimatedRowHeight = defaultHeight
            tableView.rowHeight = UITableViewAutomaticDimension

            tableView.tableFooterView = UIView()
        }
    }

}

extension TableViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }

        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else {
                break
            }

            cell.pushMeButton.setTitle("Push Me. section 0!", for: .normal)
            return cell

        default: break
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: cellStyle, for: indexPath)

        cell.textLabel?.text = "\(indexPath.section) - \(indexPath.row)"
        cell.detailTextLabel?.text = "OK"
        cell.accessoryType = .disclosureIndicator

        return cell
    }
}

extension TableViewController : UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.section == 0, indexPath.row == 0 {
//            return CustomCell.defaultHeight
//        }
//
//        return defaultHeight
//    }
}

private let cellStyle = "cellStyle"
private let defaultHeight = CGFloat(44)
