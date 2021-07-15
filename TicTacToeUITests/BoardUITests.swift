// Created 11/07/2021

import XCTest

final class BoardUITests: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        app.launch()
    }
    
    func test_viewHas9boardButtons() {
        for i in 1...9 {
            let button = app.buttons["boardButton \(i)"]
            XCTAssertTrue(button.waitForExistence(timeout: 1))
        }
    }
    
    func test_givenGameWasWon_resetGameButtonBecomesHittable() {
        for i in 1...9 {
            app.buttons["boardButton \(i)"].tap()
        }

        let resetGameButton = app.buttons["resetGameButtonIdentifier"]
        XCTAssertTrue(resetGameButton.isHittable)
    }
}
