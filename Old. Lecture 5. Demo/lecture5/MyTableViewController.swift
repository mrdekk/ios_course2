//
//  MyTableViewController.swift
//  lecture5
//
//  Created by Sergey Urazov on 03/05/17.
//  Copyright © 2017 Sergey Urazov. All rights reserved.
//

import Foundation
import UIKit

class MyTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.reloadData()
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 75.0
    }
    
    let cellIdentifier = "cell"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MyCell else { return UITableViewCell() }
        
        let text: String = {
            var s = indexPath.description
            for _ in 0..<50 {
                s += " abcd efg"
            }
            return s
        }()
        cell.labels.forEach({ $0.text = text })

        return cell
    }
    
}
