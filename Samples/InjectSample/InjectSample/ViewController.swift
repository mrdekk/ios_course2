//
//  ViewController.swift
//  InjectSample
//
//  Created by Denis Malykh on 04.04.18.
//  Copyright © 2018 Yandex. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    weak var operationsFactory: OperationFactory!

    override func viewDidLoad() {
        super.viewDidLoad()

        let op = operationsFactory.buildGetNoteListOperation()

        let uop = BlockOperation { [op] in
            print(op.notes.flatMap { $0.uid })
        }

        uop.addDependency(op)
        OperationQueue.main.addOperations([op, uop], waitUntilFinished: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

