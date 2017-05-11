//
//  ViewController2.swift
//  lecture
//
//  Created by Sergey Urazov on 10/04/17.
//  Copyright © 2017 Sergey Urazov. All rights reserved.
//

import Foundation
import UIKit

class ViewController2: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view2 = View2_frames()
        view2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(view2)
        
        let views: [String: AnyObject] = ["v": view2, "tlg": topLayoutGuide]
        let allConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[tlg]-[v]|", options: [], metrics: nil, views: views) +
            NSLayoutConstraint.constraints(withVisualFormat: "H:|[v]|", options: [], metrics: nil, views: views)
        
        NSLayoutConstraint.activate(allConstraints)
    }
    
}
