//
//  ViewController.swift
//  Sample4
//
//  Created by Denis Malykh on 21.03.18.
//  Copyright © 2018 Yandex. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func didTap(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }

}

