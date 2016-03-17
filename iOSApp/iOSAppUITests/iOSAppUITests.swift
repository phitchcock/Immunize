//
//  iOSAppUITests.swift
//  iOSAppUITests
//
//  Created by Peter Hitchcock on 3/2/16.
//  Copyright © 2016 Peter Hitchcock. All rights reserved.
//

import XCTest

class iOSAppUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let app = XCUIApplication()
        app.buttons["List of Locations"].tap()
        
        let tablesQuery = app.tables
        tablesQuery.staticTexts["Sacramento Ca 95822"].swipeDown()

        let cellLabel = app.cells.staticTexts["DHA"]
        let exists = NSPredicate(format: "exists == true")
        expectationForPredicate(exists, evaluatedWithObject: cellLabel, handler: nil)
        waitForExpectationsWithTimeout(2, handler: nil)

        tablesQuery.staticTexts["Tuesday November 3"].tap()

        let viewLabel = app.staticTexts["DHA"]
        let existsPredicate = NSPredicate(format: "exists == true")
        expectationForPredicate(existsPredicate, evaluatedWithObject: viewLabel, handler: nil)
        waitForExpectationsWithTimeout(2, handler: nil)

        app.buttons["OK"].tap()
        app.navigationBars["Immunization Locations"].buttons["back"].tap()
        app.buttons["Map of Locations"].tap()
        app.navigationBars["Map of Locations"].buttons["back"].tap()

    }
    
}
