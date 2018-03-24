//
//  CustomCell.swift
//  Sample4
//
//  Created by Denis Malykh on 21.03.18.
//  Copyright © 2018 Yandex. All rights reserved.
//

import UIKit

final class CustomCell : UITableViewCell {

    static let identifier = "customCell"
    static let defaultHeight = CGFloat(150)

    @IBOutlet weak var pushMeButton: UIButton! {
        didSet {
            pushMeButton.setTitle("Нажми Меня!", for: .normal)
        }
    }
}
