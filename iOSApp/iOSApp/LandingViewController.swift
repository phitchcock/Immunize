//
//  LandingViewController.swift
//  iOSApp
//
//  Created by Peter Hitchcock on 3/2/16.
//  Copyright © 2016 Peter Hitchcock. All rights reserved.
//

import UIKit
import Spring

class LandingViewController: UIViewController {

    let device = Device()

    // MARK: @IBOutlets
    @IBOutlet weak var listLocationsButton: DesignableButton!
    @IBOutlet weak var mapLocationsButton: UIButton!
    @IBOutlet weak var imageView: DesignableImageView!
    @IBOutlet weak var landingLabel: UILabel!

    // MARK: View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        if device == .iPhone4s || device == .iPadAir || device == .iPadAir2 || device == .iPad2 || device == .iPad3 /*|| device == .Simulator*/ {
            landingLabel.hidden = true
            print(device)
        } else {
            print(device)
        }
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        imageView.animation = "pop"
        imageView.curve = "spring"
        imageView.duration = 1.5
        imageView.damping = 0.1
        imageView.velocity = 0.2
        imageView.animate()
    }

    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func unwindToLandingSegue(segue: UIStoryboardSegue) {
    }
}
