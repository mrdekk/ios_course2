//
//  MyView.swift
//  lecture
//
//  Created by Sergey Urazov on 26/04/17.
//  Copyright © 2017 Sergey Urazov. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class MyView: UIView {
    
    @IBInspectable var titleColor: UIColor? {
        didSet {
            titleLabel.textColor = titleColor
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    func commonInit() {
        guard let nibName = NSStringFromClass(type(of: self)).components(separatedBy: ".").last else {
            return
        }
        guard let nibView = Bundle(for: type(of: self)).loadNibNamed(nibName, owner: self, options: nil)?.last as? UIView else {
            return
        }
        
        addSubview(nibView)
        nibView.frame = bounds
        nibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
