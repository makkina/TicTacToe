// Created 11/07/2021

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    private var game: Game!
    
    override func setUp() {
        super.setUp()
        game = Game()
    }
    
    // MARK: - Initialising game

    func test_setsActivePlayerToX() {
        XCTAssertEqual(Player.X, game.activePlayer)
    }
    
    func test_setsGameStateIsPlaying() {
        XCTAssertEqual(GameState.playing, game.gameState)
    }
    
    func test_setsWinnerToNil() {
        XCTAssertNil(game.winner)
    }
}
