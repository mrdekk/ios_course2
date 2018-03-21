//
//  ViewController.swift
//  Sample2
//
//  Created by Denis Malykh on 14.03.18.
//  Copyright © 2018 Yandex. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var manualView: ManualView!
    private var automaticView: AutomaticView!

    override func viewDidLoad() {
        super.viewDidLoad()
        manualView = ManualView(frame: .zero)
        view.addSubview(manualView)

        let nib = UINib(nibName: "AutomaticView", bundle: Bundle.main)
        if let view = nib.instantiate(withOwner: nil, options: nil).first as? AutomaticView {
            self.view.addSubview(view)
            self.automaticView = view
            view.backgroundColor = .red
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [manualView] in
            manualView?.title = "No no no"
        }
    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let vc = segue.destination as? ViewController {
//            vc.title = ""
//            return
//        }
//
//        super.prepare(for: segue, sender: sender)
//    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        manualView.frame = CGRect(
            x: 0, y: view.safeAreaInsets.top,
            width: 100, height: 150
        )

        let size = automaticView.systemLayoutSizeFitting(
            CGSize(
                width: view.bounds.size.width,
                height: view.bounds.size.height - manualView.frame.height
            ),
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .fittingSizeLevel
        )
        automaticView.frame = CGRect(
            x: 0,
            y: manualView.frame.maxY,
            width: size.width,
            height: size.height
        )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

