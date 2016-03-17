//
//  HHSViewController.swift
//  iOSApp
//
//  Created by Peter Hitchcock on 3/17/16.
//  Copyright © 2016 Peter Hitchcock. All rights reserved.
//

import UIKit

class HHSViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = NSURL (string: "http://www.dhhs.saccounty.net/Pages/DHHSHome.aspx")
        let requestObj = NSURLRequest(URL: url!)
        webView.loadRequest(requestObj)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
