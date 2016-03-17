//
//  iOSAppTests.swift
//  iOSAppTests
//
//  Created by Peter Hitchcock on 3/2/16.
//  Copyright © 2016 Peter Hitchcock. All rights reserved.
//

import XCTest
@testable import iOSApp

class iOSAppTests: XCTestCase {

    func testLocation() {
        let location = Location(name: "Test", streetNumber: "4000", streetName: "Clarewood Way", city: "Sacramento", state: "Ca", zip: "95835", date: "Today", time: "5pm")
        XCTAssert(location.name == "Test")
        XCTAssert(location.streetNumber == "4000")
        XCTAssert(location.streetName == "Clarewood Way")
        XCTAssert(location.city == "Sacramento")
        XCTAssert(location.state == "Ca")
        XCTAssert(location.zip == "95835")
        XCTAssert(location.date == "Today")
        XCTAssert(location.time == "5pm")
    }
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
