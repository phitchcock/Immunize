//
//  Location.swift
//  iOSApp
//
//  Created by Peter Hitchcock on 3/2/16.
//  Copyright © 2016 Peter Hitchcock. All rights reserved.
//

import Foundation

class Location {
    var name: String!
    var streetNumber: String!
    var streetName: String!
    var city: String!
    var state: String!
    var zip: String!
    var date: String?
    var time: String?
    var createdAt: String?
    var updatedAt: String?

    init(name: String, streetNumber: String, streetName: String, city: String, state: String, zip: String) {

        self.name = name
        self.streetNumber = streetNumber
        self.streetName = streetName
        self.city = city
        self.state = state
        self.zip = zip
    }

}