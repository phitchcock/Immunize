//
//  MapViewController.swift
//  iOSApp
//
//  Created by Peter Hitchcock on 3/2/16.
//  Copyright © 2016 Peter Hitchcock. All rights reserved.
//

import UIKit
import MapKit
import Alamofire

class MapViewController: UIViewController {

    var locations: [Location] = [Location]()

    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(animated: Bool) {
        getLocations()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func getLocations() {

        Alamofire.request(.GET, "https://sac-immunize.herokuapp.com/api/v1/locations")
            .responseJSON { response in

                if let JSON = response.result.value {

                    self.locations.removeAll()

                    let dict = JSON

                    let ar = dict["locations"] as! [AnyObject]

                    for a in ar {

                        var name: String
                        var streetNumber: String
                        var streetName: String
                        var city: String
                        var state: String
                        var zip: String

                        if let nameJson = a["name"] {
                            name = nameJson as! String
                        } else {
                            name = "ERROR"
                        }

                        if let streetNumberJson = a["street_number"] {
                            streetNumber = streetNumberJson as! String
                        } else {
                            streetNumber = "ERROR"
                        }

                        if let streetNameJson = a["street_name"] {
                            streetName = streetNameJson as! String
                        } else {
                            streetName = "ERROR"
                        }

                        if let cityJson = a["city"] {
                            city = cityJson as! String
                        } else {
                            city = "ERROR"
                        }

                        if let stateJson = a["state"] {
                            state = stateJson as! String
                        } else {
                            state = "ERROR"
                        }

                        if let zipJson = a["zip"] {
                            zip = zipJson as! String
                        } else {
                            zip = "ERROR"
                        }

                        let location = Location(name: name, streetNumber: streetNumber, streetName: streetName, city: city, state: state, zip: zip)
                        
                        self.locations.append(location)
                        
                    }
                    self.reverseGeocodeLocations()
                }
        }
        
    }

    func reverseGeocodeLocations() {
        for location in locations {

            let address = "\(location.streetNumber) \(location.streetName) \(location.city) \(location.state) \(location.zip)"
            let geocoder = CLGeocoder()

            // Carmichael to center map lat long 38.6249969,-121.3591972
            geocoder.geocodeAddressString(address, completionHandler: { (placemarks: [CLPlacemark]?, error: NSError?) -> Void in

                if let placemark = placemarks![0] as? CLPlacemark {

                    let location = CLLocationCoordinate2D(latitude: 38.6249969, longitude: -121.3591972)
                    let span  =  MKCoordinateSpanMake(0.7, 0.7)
                    let region = MKCoordinateRegion(center: location, span: span)

                    self.mapView.addAnnotation(MKPlacemark(placemark: placemark))
                    self.mapView.region = region
                }
            })
        }
    }

    
}
