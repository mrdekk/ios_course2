//
//  ViewController6.swift
//  lecture
//
//  Created by Sergey Urazov on 17/04/17.
//  Copyright © 2017 Sergey Urazov. All rights reserved.
//

import Foundation
import UIKit

class ViewController6: UIViewController {
    
    
    @IBOutlet weak var button: UIButton!
    
//    let sw = MySwiftClass()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.addTarget(self, action: #selector(buttonhandler(sender:)), for: .touchUpInside)
//        button.addTarget(sw, action: #selector(MySwiftClass.buttonhandler(sender:)), for: .touchUpInside)
//        button.addTarget(sw, action: #selector(foo), for: .touchUpInside)
    }
    
    func buttonhandler(sender: UIButton) {
        let alert = UIAlertController(title: "Alert", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}

/*
 class MySwiftClass {
    
    
    @objc func buttonhandler(sender: UIButton) {
//        let alert = UIAlertController(title: "Alert", message: nil, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
//        present(alert, animated: true, completion: nil)
    }
    
}
 */
