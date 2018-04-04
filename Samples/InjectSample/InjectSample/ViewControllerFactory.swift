//
//  ViewControllerFactory.swift
//  InjectSample
//
//  Created by Denis Malykh on 04.04.18.
//  Copyright © 2018 Yandex. All rights reserved.
//

import Foundation
import UIKit

protocol ViewControllerFactory : class {
    func buildViewController() -> UIViewController?
}

class ConcreteViewControllerFactory : ViewControllerFactory {
    let operationFactory: OperationFactory!
    init(operationFactory: OperationFactory) {
        self.operationFactory = operationFactory
    }

    func buildViewController() -> UIViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let vc = storyboard.instantiateInitialViewController() as? ViewController else { return nil }
        vc.operationsFactory = operationFactory
        return vc
    }
}
