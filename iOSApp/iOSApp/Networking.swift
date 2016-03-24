//
//  Networking.swift
//  iOSApp
//
//  Created by Peter Hitchcock on 3/17/16.
//  Copyright © 2016 Peter Hitchcock. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class Networking {

    func getLocations( var locations: [Location], tableView: UITableView) {

        Alamofire.request(.GET, locationUrl)
            .responseJSON { response in

                if let JSON = response.result.value {
                    locations.removeAll()



                    let dict = JSON

                    let ar = dict["locations"] as! [AnyObject]

                    for a in ar {

                        // TODO: Potential crash if streetnumber != a numerical string need to check
                        var name: String
                        var streetNumber: String
                        var streetName: String
                        var city: String
                        var state: String
                        var zip: String
                        var date: String
                        var time: String
                        var info: String

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

                        if let dateJson = a["date"] {
                            date = dateJson as! String
                        } else {
                            date = "ERROR"
                        }

                        if let timeJson = a["time"] {
                            time = timeJson as! String
                        } else {
                            time = "ERROR"
                        }

                        if let infoJson = a["info"] {
                            info = infoJson as! String
                        } else {
                            info = "ERROR"
                        }

                        let location = Location(name: name, streetNumber: streetNumber, streetName: streetName, city: city, state: state, zip: zip, date: date, time: time)
                        location.info = info

                        locations.append(location)

                    }
                    print(locations.count)
                    dispatch_async(dispatch_get_main_queue(),{
                        tableView.reloadData()
                    })
                }
        }

    }
}