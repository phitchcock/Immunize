//
//  ViewController.swift
//  iOSApp
//
//  Created by Peter Hitchcock on 3/2/16.
//  Copyright © 2016 Peter Hitchcock. All rights reserved.
//

import UIKit
import Alamofire

class LocationsViewController: UIViewController {

    var locations: [Location] = [Location]()

    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
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
                    self.tableView.reloadData()
                }
        }

    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "locationSegue" {

            let dvc = segue.destinationViewController as! LocationViewController

            if let row = tableView.indexPathForSelectedRow?.row {

                let location = locations[row]

                dvc.location = location

            }
        }
    }
}

extension LocationsViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! LocationTableViewCell
        let locationCell = locations[indexPath.row]
        cell.nameLabel.text = locationCell.name
        cell.streetlabel.text = "\(locationCell.streetNumber) \(locationCell.streetName)"
        cell.cityLabel.text = "\(locationCell.city) \(locationCell.state) \(locationCell.zip)"
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

}

