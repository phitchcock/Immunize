//
//  DeveloperViewController.swift
//  iOSApp
//
//  Created by Peter Hitchcock on 3/4/16.
//  Copyright © 2016 Peter Hitchcock. All rights reserved.
//

import UIKit

class DeveloperViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = NSURL (string: "http://www.petehitchcock.com")
        let requestObj = NSURLRequest(URL: url!)
        webView.loadRequest(requestObj)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
