//
//  ViewController.swift
//  lecture
//
//  Created by Sergey Urazov on 07/04/17.
//  Copyright © 2017 Sergey Urazov. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {
    
    var v: UIView = {
        let view = UIView(frame: CGRect(x: 100, y: 300, width: 100, height: 150))
        view.backgroundColor = UIColor.red
        let xv = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        xv.backgroundColor = UIColor.green
        view.addSubview(xv)
        return view
    }()
    
    let time = 2.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(v)
        printValues()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + time) {
            self.v.transform = CGAffineTransform(translationX: 100.0, y: -100.0)
            self.printValues()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + time * 2) {
            self.v.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_2))
            self.printValues()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + time * 3) { 
            self.v.transform = CGAffineTransform(scaleX: 3.5, y: 0.5)
            self.printValues()
        }
        
    }
    
    private func printValues() {
        print("-----------")
        print("frame: \(v.frame)")
        print("bounds: \(v.bounds)")
    }

}

