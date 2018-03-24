//
//  ContinerViewController.swift
//  Sample4
//
//  Created by Denis Malykh on 21.03.18.
//  Copyright © 2018 Yandex. All rights reserved.
//

import UIKit

final class ContainerViewController : UIViewController {
    @IBOutlet private weak var containerView: UIView! {
        didSet {
            containerView.layer.masksToBounds = true
        }
    }

    private var tableController: TableViewController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "TableViewController") as? TableViewController {
            addChildViewController(vc)
            vc.view.frame = containerView.bounds
            containerView.addSubview(vc.view)
            vc.didMove(toParentViewController: self)

            tableController = vc
        }
    }

    deinit {
        if let vc = tableController {
            vc.willMove(toParentViewController: nil)
            vc.view.removeFromSuperview()
            vc.removeFromParentViewController()
        }
        }

    @IBAction func didTapScrollButton(_ button: UIButton) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "ScrollViewController") as? ViewController else {
            return
        }

        self.present(vc, animated: true, completion: nil)
    }
}
