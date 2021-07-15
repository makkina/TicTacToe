// Created 11/07/2021

import XCTest

final class BoardUITests: XCTestCase {
    
    private var app: XCUIApplication!
    private var allBoardButtons: [XCUIElement]!
    
    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        app.launch()
        
        allBoardButtons = [XCUIElement]()
        for i in 1...9 {
            allBoardButtons.append(app.buttons["boardButton \(i)"])
        }
    }
    
    func test_viewHas9boardButtons() {
        for button in allBoardButtons {
            XCTAssertTrue(button.waitForExistence(timeout: 1))
        }
    }
    
    func test_givenGameWasWon_resetGameButtonBecomesHittable() {
        for button in allBoardButtons {
            button.tap()
        }
        
        let resetGameButton = app.buttons["resetGameButtonIdentifier"]
        XCTAssertTrue(resetGameButton.isHittable)
    }
}
