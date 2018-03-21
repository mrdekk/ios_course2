//
//  ViewController4_2.swift
//  lecture
//
//  Created by Sergey Urazov on 17/04/17.
//  Copyright © 2017 Sergey Urazov. All rights reserved.
//

import Foundation
import UIKit

class ViewController4_2: UIViewController {
    
    @IBOutlet private weak var label: UILabel! {
        didSet {
            label.text = text
        }
    }
    
    var text: String? {
        didSet {
            label?.text = text
        }
    }

}
