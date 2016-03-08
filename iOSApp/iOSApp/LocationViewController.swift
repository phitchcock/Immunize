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

            // Geocode from adress
            geocoder.geocodeAddressString(address, completionHandler: { (placemarks: [CLPlacemark]?, error: NSError?) -> Void in
                if let placemark = placemarks![0] as? CLPlacemark {

                    // TODO: Use different placemark add directions button
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
    
    // TODO: Add action for notify button - add to calendar
    @IBAction func addEventToCalendar(sender: UIButton) {

        let eventStore = EKEventStore()

        let startDate = NSDate()
        let endDate = startDate.dateByAddingTimeInterval(60 * 60) // One hour

        if (EKEventStore.authorizationStatusForEntityType(.Event) != EKAuthorizationStatus.Authorized) {
            eventStore.requestAccessToEntityType(.Event, completion: {
                granted, error in
                self.createEvent(eventStore, title: "DJ's Test Event", startDate: startDate, endDate: endDate)
            })
        } else {
            createEvent(eventStore, title: "DJ's Test Event", startDate: startDate, endDate: endDate)
        }
        
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
                print("you have pressed OK button");
            }
            alertController.addAction(okAction)

            self.presentViewController(alertController, animated: true, completion:nil)

        } catch {
            print("Bad things happened")
        }
    }
}

extension LocationViewController: MKMapViewDelegate {

    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {

        let identifier = "myPin"

        if annotation.isKindOfClass(MKUserLocation) {
            return nil
        }

        let detailButton: UIButton = UIButton(type: UIButtonType.DetailDisclosure)

        // Reuse the annotation if possible
        var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)

        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "pin")
            annotationView!.canShowCallout = true
            annotationView!.image = UIImage(named: "pin.png")
            annotationView!.rightCalloutAccessoryView = detailButton
        }
        else {
            annotationView!.annotation = annotation
        }

        return annotationView
    }
}

