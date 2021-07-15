// Created 11/07/2021

import XCTest

final class BoardUITests: XCTestCase {
    
    private var app: XCUIApplication!
    private var allBoardButtons: [XCUIElement]!
    
    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        app.launch()
        
        generateAllBoardButtons()
    }
    
    func test_viewHas9boardButtons() {
        for button in allBoardButtons {
            XCTAssertTrue(button.waitForExistence(timeout: 1))
        }
    }
    
    // MARK: - Game is Over
    
    /*
     Board Composition:
        x o x
        o x o
        x - -
     */
    func test_givenGameWasWon_resetGameButtonBecomesHittable() {
        for button in allBoardButtons {
            button.tap()
        }
        
        let resetGameButton = app.buttons["resetGameButtonIdentifier"]
        XCTAssertTrue(resetGameButton.isHittable)
    }

    /*
     Board Composition:
        1=x   2=o   3=x
        4=x   5=o   6=x
        7=o   8=x   9=o
     */
    func test_givenGameWasDraw_resetGameButtonBecomesHittable() {
                         // x  o  x  o  x  o  x  o  x
        let drawSequence = [1, 2, 3, 5, 6, 7, 8, 9, 4]
        
        for index in drawSequence {
            allBoardButtons[index-1].tap()
        }
        
        let resetGameButton = app.buttons["resetGameButtonIdentifier"]
        XCTAssertTrue(resetGameButton.isHittable)
    }
}

// MARK: - Private Helper Methods

extension BoardUITests {
    
    private func generateAllBoardButtons() {
        allBoardButtons = [XCUIElement]()
        for i in 1...9 {
            allBoardButtons.append(app.buttons["boardButton \(i)"])
        }
    }
}
