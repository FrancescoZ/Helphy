//
//  SearchViewControllerTest.swift
//  Helphy
//
//  Created by Francesco Zanoli on 09/07/2017.
//  Copyright © 2017 Francesco Zanoli. All rights reserved.
//

import XCTest

class SearchViewControllerTest: XCTestCase {
        
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
    
    func testTableViewDisplay() {
        let app = XCUIApplication()
        let table = app.tables.element(boundBy: 0)
        
        let francescozanoCell = table.cells.element(boundBy: 0)
        XCTAssert(francescozanoCell.staticTexts["francescozano"].exists)
        
        let diambraCell = table.cells.element(boundBy: 1)
        XCTAssert(diambraCell.staticTexts["diambrugo"].exists)
    }
}
