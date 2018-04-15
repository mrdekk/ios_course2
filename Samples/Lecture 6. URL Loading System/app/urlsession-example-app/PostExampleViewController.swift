//
//  PostExampleViewController.swift
//  urlsession-example-app
//
//  Created by Roman Paradeev on 14.05.17.
//  Copyright © 2017 Roman Paradeev. All rights reserved.
//

import UIKit

class PostExampleViewController: UIViewController {
    @IBOutlet var textField: UITextField!
    @IBOutlet var label: UITextView!

    @IBAction func send() {
        let message = textField.text!
        let url = URL(string: "http://localhost:8080/message")!

        // TODO
        guard let jsonData = try? JSONSerialization.data(withJSONObject: ["message": message], options: []) else {
            NSLog("Oops, no json data")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData

        URLSession.shared.dataTask(with: request) { [weak self] (data, _, error) in
            guard error == nil, let _ = data else {
                NSLog("Oops")
                return
            }

            DispatchQueue.main.async { [weak self] in
                guard let sself = self else { return }
                let alert = UIAlertController(title: "Hurray", message: "Message \(message) is successfully submitted", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                sself.present(alert, animated: true, completion: nil)
            }
        }.resume()
    }

    @IBAction func reload() {
        let url = URL(string: "http://localhost:8080/messages")!

        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in

            if let data = data,
                let messages = try? JSONSerialization.jsonObject(with: data) as? [String] {

                DispatchQueue.main.async {
                    self.label.text = messages?.joined(separator: "\n")
                }
            }
        }

        task.resume()
    }
}
