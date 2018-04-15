//
//  AuthenticationExampleViewController.swift
//  urlsession-example-app
//
//  Created by Roman Paradeev on 15.05.17.
//  Copyright © 2017 Roman Paradeev. All rights reserved.
//

import UIKit

class AuthenticationExampleViewController: UIViewController {
    @IBOutlet var label: UILabel!

    lazy var session: URLSession = {
        return URLSession(configuration: .default, delegate: self, delegateQueue: .main)
    }()

    @IBAction func revealSecret(_ sender: Any) {
        let url = URL(string: "http://localhost:8080/secret")!
        let task = session.dataTask(with: url)

        task.resume()
    }
}

extension AuthenticationExampleViewController: URLSessionDataDelegate {
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if let error = error{
            label.text = error.localizedDescription
        }

        if let response = task.response as? HTTPURLResponse {
            label.text = "Status: \(response.statusCode)"
        }
    }

    // TODO:
    func urlSession(_ session: URLSession, task: URLSessionTask, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        completionHandler(.useCredential, URLCredential(user: "admin", password: "password1", persistence: .forSession))
    }

}
