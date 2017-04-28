//
//  View2.swift
//  lecture
//
//  Created by Sergey Urazov on 10/04/17.
//  Copyright © 2017 Sergey Urazov. All rights reserved.
//

import Foundation
import UIKit

class View2_frames: UIView {
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        addSubview(imageView)
        addSubview(leftButton)
        addSubview(rightButton)
        
//        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Subviews
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22.0)
        label.text = "Какого цвета платье?"
        label.textAlignment = .center
        return label
    }()
    
    let imageView: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "dress"))
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    let leftButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Черно-синее", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18.0)
        return button
    }()
    
    let rightButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Бело-золотое", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18.0)
        return button
    }()
    
    // MARK: Manual Layout

    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.frame = CGRect(x: 0.0, y: 0.0, width: bounds.width, height: 40.0)
        
        if let imgSize = imageView.image?.size {
            let imgMargin = (bounds.width - imgSize.width) / 2.0
            imageView.frame = CGRect(x: imgMargin, y: titleLabel.frame.size.height, width: imgSize.width, height: imgSize.height)
        }
        
        let goodButtonSize = leftButton.intrinsicContentSize
        let badButtonSize = rightButton.intrinsicContentSize
        let buttonsGap: CGFloat = 20.0
        let buttonsWidth = goodButtonSize.width + badButtonSize.width + buttonsGap
        let buttonsMargin = (bounds.size.width - buttonsWidth) / 2.0
        
        let buttonsFrame = CGRect(x: buttonsMargin, y: imageView.frame.maxY + 30.0, width: buttonsWidth, height: 50.0)
        leftButton.frame = CGRect(x: buttonsFrame.minX, y: buttonsFrame.minY, width: goodButtonSize.width, height: buttonsFrame.height)
        rightButton.frame = CGRect(x: buttonsFrame.minX + goodButtonSize.width + buttonsGap, y: buttonsFrame.minY, width: badButtonSize.width, height: buttonsFrame.height)
    }
    
    // MARK: Autolayout
    
//    func setupConstraints() {
//        subviews.forEach({ $0.translatesAutoresizingMaskIntoConstraints = false })
//        let buttonsGap: CGFloat = 20.0
//        let views = ["title": titleLabel, "img": imageView, "good": goodButton, "bad": badButton]
//        let metrics = ["buttonsV": 30.0, "buttonsGap": buttonsGap]
//        let formats = [
//            "V:|[title]-[img]-(buttonsV)-[good]",
//            "H:|[title]|",
//            "H:[good]-(buttonsGap)-[bad]"
//        ]
//        
//        for format in formats {
//            NSLayoutConstraint.constraints(withVisualFormat: format,
//                                           options: [],
//                                           metrics: metrics,
//                                           views: views).forEach({ $0.isActive = true })
//        }
//        
//        NSLayoutConstraint(item: goodButton,
//                           attribute: .centerY,
//                           relatedBy: .equal,
//                           toItem: badButton,
//                           attribute: .centerY,
//                           multiplier: 1.0,
//                           constant: 0.0).isActive = true
//        NSLayoutConstraint(item: imageView,
//                           attribute: .centerX,
//                           relatedBy: .equal,
//                           toItem: titleLabel,
//                           attribute: .centerX,
//                           multiplier: 1.0,
//                           constant: 0.0).isActive = true
//        NSLayoutConstraint(item: goodButton,
//                           attribute: .trailing,
//                           relatedBy: .equal,
//                           toItem: self,
//                           attribute: .centerX,
//                           multiplier: 1.0,
//                           constant: -buttonsGap / 2.0).isActive = true
//        NSLayoutConstraint(item: badButton,
//                           attribute: .leading,
//                           relatedBy: .equal,
//                           toItem: self,
//                           attribute: .centerX,
//                           multiplier: 1.0,
//                           constant: buttonsGap / 2.0).isActive = true
//    }
    
}
