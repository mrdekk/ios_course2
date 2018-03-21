//
//  ViewController4_1.swift
//  lecture
//
//  Created by Sergey Urazov on 17/04/17.
//  Copyright © 2017 Sergey Urazov. All rights reserved.
//

import Foundation
import UIKit

class ViewController4_1: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dst = segue.destination as? ViewController4_2 {
            dst.text = textField.text
        }
    }
    
}
