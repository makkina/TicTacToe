// Created 12/07/2021

import XCTest
@testable import TicTacToe

class GameFactoryTests: XCTestCase {
    
    private var game: Game!
    
    override func setUp() {
        game = GameFactory.game()
    }
    
    func test_gameHasActivePlayerSetToPlayerX() {
        XCTAssertEqual(Player.X, game.activePlayer)
    }
    
    func test_gameHasSelectedBoardValuesSetToZero9times() {
        let expectedBoard = [
            0, 0, 0,
            0, 0, 0,
            0, 0, 0
        ]
        XCTAssertEqual(expectedBoard, game.selectedBoardValues)
    }
    
    func test_gameHasGameStateSetToPlaying() {
        XCTAssertEqual(GameState.playing, game.gameState)
    }
    
    func test_gameHasWinnerSetToNil() {
        XCTAssertNil(game.winner)
    }
}
