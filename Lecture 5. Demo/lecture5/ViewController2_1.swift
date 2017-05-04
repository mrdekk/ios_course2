//
//  ViewController2_1.swift
//  lecture5
//
//  Created by Sergey Urazov on 01/05/17.
//  Copyright © 2017 Sergey Urazov. All rights reserved.
//

import Foundation
import UIKit

class ViewController2_1: UIViewController {
    
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var container: UIView!
    
    private var child: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { 
            self.addRedController()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) {
            self.removeRed()
        }
    }
    
    private func addRedController() {
        let vc = ViewController2_2()
        child = vc
        
        addChildViewController(vc)
        
        
        let childView = vc.view
        childView?.frame = container.bounds
        childView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        container.addSubview(vc.view)
        
        childView?.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        UIView.animate(withDuration: 0.3, animations: { 
            childView?.transform = CGAffineTransform.identity
        }) { (_) in
            vc.didMove(toParentViewController: self)
        }
    }
    
    func removeRed() {
        child.willMove(toParentViewController: nil)
        child.view.removeFromSuperview()
        child.removeFromParentViewController()
    }
    
}
