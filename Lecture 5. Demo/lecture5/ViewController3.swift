//
//  ViewController3.swift
//  lecture5
//
//  Created by Sergey Urazov on 02/05/17.
//  Copyright © 2017 Sergey Urazov. All rights reserved.
//

import Foundation
import UIKit

class ViewController3: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        definesPresentationContext = true
    }
    
    @IBAction func handleAction(_ sender: UIButton) {
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor.red.withAlphaComponent(0.5)
        
        show(vc, sender: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { 
            self.navigationController?.popViewController(animated: true)
        }
    }

}
