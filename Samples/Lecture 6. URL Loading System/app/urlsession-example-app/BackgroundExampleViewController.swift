//
//  BackgroundExampleViewController.swift
//  urlsession-example-app
//
//  Created by Roman Paradeev on 15.05.17.
//  Copyright © 2017 Roman Paradeev. All rights reserved.
//

import UIKit

class BackgroundExampleViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var rateLabel: UILabel!

    @IBAction func reset() {
        imageView.image = nil
        rateLabel.text = "0%"
    }

    lazy var session: URLSession = {
        let configuration = URLSessionConfiguration.default

        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData

        let session = URLSession(configuration: configuration, delegate: self, delegateQueue: .main)

        return session
    }()

    @IBAction func downloadLargeImage(_ sender: Any) {
        reset()

        let url = URL(string: "https://unsplash.com/photos/7nrsVjvALnA/download?force=true")!
        let task = session.downloadTask(with: url)

        task.resume()
    }
}

extension BackgroundExampleViewController: URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession,
                    downloadTask: URLSessionDownloadTask,
                    didWriteData bytesWritten: Int64,
                    totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let rate = Int(Double(totalBytesWritten) / Double(totalBytesExpectedToWrite) * 100)

        rateLabel.text = "\(rate)%"
    }

    func urlSession(_ session: URLSession,
                    downloadTask: URLSessionDownloadTask,
                    didFinishDownloadingTo location: URL) {
        rateLabel.text = "100%"
        imageView.image = UIImage(data: try! Data(contentsOf: location))
    }

    func urlSessionDidFinishEvents(forBackgroundURLSession session: URLSession) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        if let completionHandler = appDelegate.backgroundSessionCompletionHandler {
            appDelegate.backgroundSessionCompletionHandler = nil

            DispatchQueue.main.async {
                completionHandler()
            }
        }
    }
}
