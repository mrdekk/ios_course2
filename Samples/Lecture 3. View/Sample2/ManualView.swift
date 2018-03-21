//
//  ManualView.swift
//  Sample2
//
//  Created by Denis Malykh on 14.03.18.
//  Copyright © 2018 Yandex. All rights reserved.
//

import UIKit

final class ManualView : UIView {

    private let questionLabel = UILabel(frame: .zero)
    private let yesButton = UIButton(frame: .zero)
    private let noButton = UIButton(frame: .zero)

    public var title: String = "Would you like?" {
        didSet {
            questionLabel.text = title
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("Doesn't implemented yet")
        setupViews()
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(
            width: superview?.bounds.size.width ?? UIScreen.main.bounds.size.width,
            height: 100 + buttonSize.height
        )
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        questionLabel.frame = CGRect(
            x: 0, y: 0,
            width: 100, height: 100
        )

        yesButton.frame = CGRect(
            x: 0, y: questionLabel.frame.maxY,
            width: buttonSize.width,
            height: buttonSize.height
        )

        noButton.frame = CGRect(
            x: yesButton.frame.maxX,
            y: questionLabel.frame.maxY,
            width: buttonSize.width,
            height: buttonSize.height
        )
    }

    override func draw(_ rect: CGRect) {
        guard let ctx = UIGraphicsGetCurrentContext() else {
            return
        }

        ctx.setFillColor(UIColor.white.cgColor)
        ctx.fill(CGRect(x: 0, y: 0, width: rect.width, height: rect.height / 3.0))

        ctx.setFillColor(UIColor.blue.cgColor)
        ctx.fill(CGRect(x: 0, y: rect.height / 3.0, width: rect.width, height: rect.height / 3.0))

        ctx.setFillColor(UIColor.red.cgColor)
        ctx.fill(CGRect(x: 0, y: 2.0 * rect.height / 3.0, width: rect.width, height: rect.height / 3.0))
    }

    @objc func didTap(_ sender: UIButton) {
        NSLog("YES YES YES")
    }

    private func setupViews() {
        questionLabel.font = UIFont.systemFont(ofSize: 25.0)
        questionLabel.textAlignment = .center
        questionLabel.numberOfLines = 0
        questionLabel.text = "Would you like a cup of tea?"
        addSubview(questionLabel)

        yesButton.setTitle("YES", for: .normal)
        yesButton.setTitleColor(.black, for: .normal)
        yesButton.setTitleColor(.green, for: .highlighted)
        yesButton.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        addSubview(yesButton)

        noButton.setTitle("NO", for: .normal)
        noButton.setTitleColor(.black, for: .normal)
        noButton.setTitleColor(.red, for: .highlighted)
        addSubview(noButton)

        [questionLabel, yesButton, noButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = true
        }

//        NSLayoutConstraint(item: questionLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0.0).isActive = true
//        NSLayoutConstraint(item: questionLabel, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0.0).isActive = true
//        NSLayoutConstraint(item: questionLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
//        NSLayoutConstraint(item: questionLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100.0).isActive = true
//
//        NSLayoutConstraint(item: yesButton, attribute: .width, relatedBy: .equal, toItem: noButton, attribute: .width, multiplier: 1.0, constant: 0.0).isActive = true
//
//        [yesButton, noButton].forEach {
//            NSLayoutConstraint(item: $0, attribute: .top, relatedBy: .equal, toItem: questionLabel, attribute: .bottom, multiplier: 1.0, constant: 0.0).isActive = true
//            NSLayoutConstraint(item: $0, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: buttonSize.height).isActive = true
//        }
//
//        NSLayoutConstraint.constraints(withVisualFormat: "|-6-[yes][no]-6-|", options: [], metrics: nil, views: ["yes": yesButton, "no": noButton]).forEach { $0.isActive = true }
    }
}

private let buttonSize = CGSize(width: 50, height: 20)
