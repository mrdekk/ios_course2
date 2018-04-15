//
//  GetExampleViewController.swift
//  urlsession-example-app
//
//  Created by Roman Paradeev on 14.05.17.
//  Copyright © 2017 Roman Paradeev. All rights reserved.
//

import UIKit

class GetExampleViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!

    @IBAction func buttonClicked(_ sender: Any) {
        let img = "http://localhost:8080/public/apple.jpg"

        // TODO:
        guard let url = URL(string: img) else { return }
        URLSession.shared.dataTask(with: url) { [weak self] (data, _, error) in
            guard error == nil, let data = data else {
                NSLog("Ooops")
                return
            }

            DispatchQueue.main.async { [weak self] in
                guard let sself = self else { return }
                guard let image = UIImage(data: data) else {
                    NSLog("No image")
                    return
                }

                sself.imageView.image = image
            }
        }.resume()
    }
}
