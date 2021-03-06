//
//  LocationViewController.swift
//  iOSApp
//
//  Created by Peter Hitchcock on 3/2/16.
//  Copyright © 2016 Peter Hitchcock. All rights reserved.
//

import UIKit
import MapKit
import EventKit

class LocationViewController: UIViewController {

    // MARK: Properties
    var location: Location?
    var savedEventId : String = ""

    // MARK: @IBOutlets
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var infoTextArea: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!

    // MARK: View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        popupView.layer.cornerRadius = 10

        // Check object for nil
        if let location = location {
            nameLabel.text = location.name
            streetLabel.text = "\(location.streetNumber) \(location.streetName)"
            cityLabel.text = "\(location.city) \(location.state) \(location.zip)"
            dateLabel.text = location.date
            timeLabel.text = location.time
            infoTextArea.text = location.info

            let address = "\(location.streetNumber) \(location.streetName) \(location.city) \(location.state) \(location.zip)"
            let geocoder = CLGeocoder()

            // TODO: Dup code as MapViewController
            // Geocode from adress
            geocoder.geocodeAddressString(address, completionHandler: { (placemarks: [CLPlacemark]?, error: NSError?) -> Void in
                if let placemark = placemarks![0] as? CLPlacemark {

                    let location = CLLocationCoordinate2D(latitude: (placemark.location?.coordinate.latitude)!, longitude: (placemark.location?.coordinate.longitude)!)
                    let span  =  MKCoordinateSpanMake(0.01, 0.01)
                    let region = MKCoordinateRegion(center: location, span: span)

                    let placemark:CLPlacemark = placemarks![0] as CLPlacemark
                    let coordinates:CLLocationCoordinate2D = placemark.location!.coordinate
                    let pointAnnotation:MKPointAnnotation = MKPointAnnotation()

                    pointAnnotation.coordinate = coordinates
                    pointAnnotation.title = self.nameLabel.text
                    pointAnnotation.subtitle = address

                    self.mapView.region = region
                    self.mapView.addAnnotation(pointAnnotation)
                }
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // TODO: FIX Save date
    @IBAction func addEventToCalendar(sender: UIButton) {

        let eventStore = EKEventStore()

        let startDate = NSDate()
        let endDate = startDate.dateByAddingTimeInterval(60 * 120) // One hour

        let alertController = UIAlertController(title: "Save Event", message: "Do you want to save this event to your calendar?", preferredStyle: .Alert)

        let okAction = UIAlertAction(title: "OK", style: .Default) { (action:UIAlertAction!) in

            if (EKEventStore.authorizationStatusForEntityType(.Event) != EKAuthorizationStatus.Authorized) {
                eventStore.requestAccessToEntityType(.Event, completion: {
                    granted, error in
                    self.createEvent(eventStore, title: (self.location?.name)!, startDate: startDate, endDate: endDate)
                })
            } else {
                self.createEvent(eventStore, title: (self.location?.name)!, startDate: startDate, endDate: endDate)
            }

        }
        alertController.addAction(okAction)

        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action:UIAlertAction!) in
        }
        alertController.addAction(cancelAction)

        self.presentViewController(alertController, animated: true, completion:nil)
    }

    @IBAction func popViewController(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    // Creates an event in the EKEventStore
    func createEvent(eventStore: EKEventStore, title: String, startDate: NSDate, endDate: NSDate) {

        let event = EKEvent(eventStore: eventStore)

        event.title = title
        event.startDate = startDate
        event.endDate = endDate
        event.calendar = eventStore.defaultCalendarForNewEvents

        do {
            try eventStore.saveEvent(event, span: .ThisEvent)
            savedEventId = event.eventIdentifier

            let alertController = UIAlertController(title: "Event Saved to Calendar", message: "\(startDate) \(endDate)", preferredStyle: .Alert)

            let okAction = UIAlertAction(title: "OK", style: .Default) { (action:UIAlertAction!) in
            }
            alertController.addAction(okAction)

            self.presentViewController(alertController, animated: true, completion:nil)

        } catch {
            print("Bad things happened")
        }
    }
}

// MARK: MKMapViewDelegate
extension LocationViewController: MKMapViewDelegate {

    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {

        let identifier = "myPin"

        if annotation.isKindOfClass(MKUserLocation) {
            return nil
        }

        let detailButton: UIButton = UIButton(type: UIButtonType.DetailDisclosure)
        detailButton.tintColor = UIColor.blackColor()

        // Reuse the annotation if possible
        var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)

        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "pin")
            annotationView!.canShowCallout = true
            annotationView!.image = UIImage(named: "pin.png")
            annotationView!.leftCalloutAccessoryView = detailButton
        }
        else {
            annotationView!.annotation = annotation
        }

        return annotationView
    }

    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView,
        calloutAccessoryControlTapped control: UIControl) {

            let alertController = UIAlertController(title: "Would you like directions to?", message: view.annotation!.subtitle!, preferredStyle: .Alert)

            let okAction = UIAlertAction(title: "OK", style: .Default) { (action:UIAlertAction!) in
                let selectedLoc = view.annotation

                let selectedPlacemark = MKPlacemark(coordinate: selectedLoc!.coordinate, addressDictionary: nil)
                let selectedMapItem = MKMapItem(placemark: selectedPlacemark)

                let mapItems = [selectedMapItem]

                let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]

                MKMapItem.openMapsWithItems(mapItems, launchOptions:launchOptions)
            }
            alertController.addAction(okAction)

            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action:UIAlertAction!) in

            }
            alertController.addAction(cancelAction)
            
            self.presentViewController(alertController, animated: true, completion:nil)
    }
}

