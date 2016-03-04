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

    @IBOutlet weak var listLocationsButton: DesignableButton!
    @IBOutlet weak var mapLocationsButton: UIButton!
    @IBOutlet weak var imageView: DesignableImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
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
