//
//  iOSAppUITestsFastlane.swift
//  iOSAppUITestsFastlane
//
//  Created by Peter Hitchcock on 3/21/16.
//  Copyright © 2016 Peter Hitchcock. All rights reserved.
//

import XCTest

class iOSAppUITestsFastlane: XCTestCase {
        
    override func setUp() {
        super.setUp()

        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
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
        snapshot("02Locations")
        app.tables.staticTexts["Sacramento Ca 95814"].tap()
        snapshot("03Location")
        app.buttons["OK"].tap()
        app.navigationBars["Immunization Locations"].buttons["back"].tap()
        snapshot("01Landing")
        app.buttons["Map of Locations"].tap()
        snapshot("04Map")
    }
    
}
