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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(animated: Bool) {
        getLocations()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func locations(sender: UIButton) {
        getLocations()
    }

    func getLocations() {
        Alamofire.request(.GET, "https://sac-immunize.herokuapp.com/api/v1/locations")
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization

                if let JSON = response.result.value {
                    self.locations.removeAll()

                    let dict = JSON

                    let ar = dict["locations"] as! [AnyObject]

                    for a in ar {

                        let location = Location(name: a["name"] as! String, streetNumber: a["street_number"] as! String, streetName: a["street_name"] as! String, city: a["city"] as! String, state: a["state"] as! String, zip: a["zip"] as! String)

                        self.locations.append(location)

                    }
                    print(self.locations.count)
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
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = locations[indexPath.row].name
        return cell
    }

}

