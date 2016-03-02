//
//  LocationViewController.swift
//  iOSApp
//
//  Created by Peter Hitchcock on 3/2/16.
//  Copyright © 2016 Peter Hitchcock. All rights reserved.
//

import UIKit
import MapKit

class LocationViewController: UIViewController {

    var location: Location!

    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        print(location.name)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func popViewController(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
