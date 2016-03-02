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

    var location: Location?

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var infoTextArea: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        popupView.layer.cornerRadius = 10

        if let location = location {
            nameLabel.text = location.name
            streetLabel.text = "\(location.streetNumber) \(location.streetName)"
            cityLabel.text = "\(location.city) \(location.state) \(location.zip)"

            let address = "\(location.streetNumber) \(location.streetName) \(location.city) \(location.state) \(location.zip)"
            let geocoder = CLGeocoder()

            geocoder.geocodeAddressString(address, completionHandler: { (placemarks: [CLPlacemark]?, error: NSError?) -> Void in
                if let placemark = placemarks![0] as? CLPlacemark {

                    let location = CLLocationCoordinate2D(latitude: (placemark.location?.coordinate.latitude)!, longitude: (placemark.location?.coordinate.longitude)!)
                    let span  =  MKCoordinateSpanMake(0.017, 0.017)
                    let region = MKCoordinateRegion(center: location, span: span)

                    self.mapView.addAnnotation(MKPlacemark(placemark: placemark))
                    self.mapView.region = region
                }
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func popViewController(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
