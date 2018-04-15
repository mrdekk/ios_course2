//
//  GetExampleViewController.swift
//  urlsession-example-app
//
//  Created by Roman Paradeev on 14.05.17.
//  Copyright © 2017 Roman Paradeev. All rights reserved.
//

import UIKit

class CacheExampleViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!

    lazy var session: URLSession = {
        let configuration = URLSessionConfiguration.default

        configuration.urlCache = URLCache(memoryCapacity: 100 * 1024 * 1024,
                                          diskCapacity: 100 * 1024 * 1024,
                                          diskPath: nil)

        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData

        return URLSession(configuration: configuration)
    }()

    @IBAction func clearCache(_ sender: Any) {
        session.configuration.urlCache!.removeAllCachedResponses()
    }

    @IBAction func buttonClicked(_ sender: Any) {
        let url = URL(string: "http://localhost:8080/public/apple.jpg")!

        let task = session.dataTask(with: url) { data, _, _ in
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data!)
            }
        }

        task.resume()
    }
}
