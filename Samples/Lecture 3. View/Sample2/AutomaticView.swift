//
//  AutomaticView.swift
//  Sample2
//
//  Created by Denis Malykh on 14.03.18.
//  Copyright © 2018 Yandex. All rights reserved.
//

import UIKit

final class AutomaticView: UIView {

    @IBOutlet private weak var titleLabel: UILabel!

    @IBOutlet private weak var noButton: UIButton!

    @IBAction func didTap(_ sender: UIButton) {
        NSLog("HI")
    }
}
