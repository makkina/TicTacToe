// Created 11/07/2021

import XCTest

final class BoardUITests: XCTestCase {
    
    private var app: XCUIApplication!
    private var allBoardButtons: [XCUIElement]!
    private var resetGameButton: XCUIElement!
    
    override func setUp() {
        super.setUp()
        
        launchApp()
        generateAllBoardButtons()
        resetGameButton = app.buttons["resetGameButtonIdentifier"]
        continueAfterFailure = false
    }
    
    // MARK: - Game Requirements
    
    func test_viewHas9boardButtons() {
        for button in allBoardButtons {
            XCTAssertTrue(button.waitForExistence(timeout: 1))
        }
    }
    
    // MARK: - Game is Over
    
    /*
     Board Composition for Win:
        x o x
        o x o
        x - -
     */
    func test_givenGameWasWon_resetGameButtonBecomesHittable() {
        for button in allBoardButtons {
            button.tap()
        }
        
        XCTAssertTrue(resetGameButton.isHittable)
    }

    /*
     Board Composition for Draw:
        x o x
        x o x
        o x o
     */
    func test_givenGameWasDraw_resetGameButtonBecomesHittable() {
                         // x  o  x  o  x  o  x  o  x
        let drawSequence = [1, 2, 3, 5, 6, 7, 8, 9, 4]
        for index in drawSequence {
            allBoardButtons[index-1].tap()
        }
        
        XCTAssertTrue(resetGameButton.isHittable)
    }
    
    // MARK: - Restart Game
    
    func test_givenRestartGameButtonIsPressed_resetButtonHides() {
        for button in allBoardButtons {
            button.tap()
        }

        resetGameButton.tap()
        XCTAssertFalse(resetGameButton.exists)
    }
}

// MARK: - Private Helper Methods

extension BoardUITests {
    
    private func launchApp() {
        app = XCUIApplication()
        app.launch()
    }
    
    private func generateAllBoardButtons() {
        allBoardButtons = [XCUIElement]()
        for i in 1...9 {
            allBoardButtons.append(app.buttons["boardButton \(i)"])
        }
    }
}
