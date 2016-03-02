//
//  LocationViewController.swift
//  iOSApp
//
//  Created by Peter Hitchcock on 3/2/16.
//  Copyright © 2016 Peter Hitchcock. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {

    var location: Location!

    override func viewDidLoad() {
        super.viewDidLoad()

        print(location.name)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}
