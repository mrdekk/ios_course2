//
//  DrawView.swift
//  lecture
//
//  Created by Sergey Urazov on 17/04/17.
//  Copyright © 2017 Sergey Urazov. All rights reserved.
//

import Foundation
import UIKit

class DrawView: UIView {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        context.setFillColor(UIColor.blue.cgColor)
        context.setStrokeColor(UIColor.black.cgColor)
        
        context.fill(rect)
        context.stroke(rect)
        
        context.setLineWidth(20.0)
        context.setStrokeColor(UIColor.purple.cgColor)
        context.move(to: CGPoint.zero)
        context.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        context.strokePath()
        
        context.setLineWidth(10.0)
        context.setStrokeColor(UIColor.cyan.cgColor)
        context.move(to: CGPoint(x: 0, y: rect.maxY))
        context.addLine(to: CGPoint(x: rect.maxX, y: 0))
        context.strokePath()
    }
    
}
