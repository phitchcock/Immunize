//
//  LandingViewController.swift
//  iOSApp
//
//  Created by Peter Hitchcock on 3/2/16.
//  Copyright © 2016 Peter Hitchcock. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {

    @IBOutlet weak var listLocationsButton: UIButton!
    @IBOutlet weak var mapLocationsButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.translucent = true
        */

        listLocationsButton.layer.cornerRadius = 5
        listLocationsButton.layer.borderWidth = 1
        listLocationsButton.layer.borderColor = UIColor.whiteColor().CGColor
        mapLocationsButton.layer.cornerRadius = 5
        //mapLocationsButton.layer.borderWidth = 1
        //mapLocationsButton.layer.borderColor = UIColor.lightGrayColor().CGColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
