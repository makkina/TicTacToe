// Created 11/07/2021

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    private var game: Game!
    
    override func setUp() {
        super.setUp()
        game = Game(activePlayer: .X)
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
    
    func test_setsSelectedBoardValuesTo9Zeros() {
         XCTAssertEqual([0, 0, 0, 0, 0, 0, 0, 0, 0], game.selectedBoardValues)
     }
    
    // MARK: - Game Won
    
    func test_playerXCanWinGame() {
        game.checkForWinner()
        
        XCTAssertEqual(Player.X, game.winner)
    }
    
    func test_playerOCanWinGame() {
        // given
        game = Game(activePlayer: .O)
        // when
        game.checkForWinner()
        // then
        XCTAssertEqual(Player.O, game.winner)
    }
}
