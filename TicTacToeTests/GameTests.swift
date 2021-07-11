// Created 11/07/2021

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    // MARK: - Initialising game

    func test_canCreateGame() {
        let game = Game()
    }
      
    func test_setsActivePlayerToX() {
        let game = Game()
        
        XCTAssertEqual(Player.X, game.activePlayer)
    }
}
