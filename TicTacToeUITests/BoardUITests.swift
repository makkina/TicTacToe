// Created 11/07/2021

import XCTest

class BoardUITests: XCTestCase {

    func test_viewHas9boardButtons() {
        let app = XCUIApplication()
        app.launch()
        
        for i in 1...9 {
            let button = app.buttons["boardButton \(i)"]
            XCTAssertTrue(button.waitForExistence(timeout: 1))
        }
    }
    
    func test_givenGameWasWon_resetGameButtonBecomesHittable() {
        let app = XCUIApplication()
        app.launch()
        
        for i in 1...9 {
            app.buttons["boardButton \(i)"].tap()
        }

        let resetGameButton = app.buttons["resetGameButtonIdentifier"]
        XCTAssertTrue(resetGameButton.isHittable)
    }
}
