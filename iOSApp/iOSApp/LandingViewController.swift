//
//  LandingViewController.swift
//  iOSApp
//
//  Created by Peter Hitchcock on 3/2/16.
//  Copyright © 2016 Peter Hitchcock. All rights reserved.
//

import UIKit
import Spring
import Device_swift

class LandingViewController: UIViewController {

    let deviceType = UIDevice.currentDevice().deviceType

    // MARK: @IBOutlets
    @IBOutlet weak var listLocationsButton: DesignableButton!
    @IBOutlet weak var mapLocationsButton: UIButton!
    @IBOutlet weak var imageView: DesignableImageView!
    @IBOutlet weak var landingLabel: UILabel!

    // MARK: View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        switch deviceType {
        case .IPhone4:
            landingLabel.hidden = true
        case .IPhone4S:
            landingLabel.hidden = true
        case .IPad:
            landingLabel.hidden = true
        case .IPad2:
            landingLabel.hidden = true
        case .IPad3:
            landingLabel.hidden = true
        case .IPad4:
            landingLabel.hidden = true
        case .IPadAir:
            landingLabel.hidden = true
        case .IPadAir2:
            landingLabel.hidden = true
            print("ipadair")
        default:
            landingLabel.hidden = false
            print(deviceType)
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
