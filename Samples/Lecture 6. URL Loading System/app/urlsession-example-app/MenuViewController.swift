//
//  ContentsTableViewController.swift
//  urlsession-example-app
//
//  Created by Roman Paradeev on 14.05.17.
//  Copyright © 2017 Roman Paradeev. All rights reserved.
//

import UIKit

struct Example {
    let id: String
    let title: String
    var segue: String { return "example-\(id)" }
}

extension Array where Element == Example {
    func find(byID id: String) -> Element {
        return self.filter { $0.id == id }[0]
    }
}

class MenuViewController: UIViewController {
    @IBOutlet var tableView: UITableView!

    fileprivate let examples = [
        Example(id: "get", title: "Simple GET request"),
        Example(id: "post", title: "Creating resource with POST"),
        Example(id: "cache", title: "Set cache policy"),
        Example(id: "timeouts", title: "Manage timeouts"),
        Example(id: "auth", title: "Basic authentication"),
        //Example(id: "background", title: "Background tasks"),
    ]
}

extension MenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return examples.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!

        cell.textLabel?.text = examples[indexPath.row].title

        return cell
    }
}

extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: examples[indexPath.row].segue, sender: self)
    }
}
