// Created 12/07/2021

import XCTest
@testable import TicTacToe

class GameFactoryTests: XCTestCase {
    
    func test_gameHasActivePlayerSetToPlayerX() {
        let game = GameFactory.game()
        XCTAssertEqual(Player.X, game.activePlayer)
    }
    
    func test_gameHasSelectedBoardValuesSetToZero9times() {
        let game = GameFactory.game()
        let expectedBoard = [
            0, 0, 0,
            0, 0, 0,
            0, 0, 0
        ]
        XCTAssertEqual(expectedBoard, game.selectedBoardValues)
    }
    
    func test_gameHasGameStateSetToPlaying() {
        let game = GameFactory.game()
        XCTAssertEqual(GameState.playing, game.gameState)
    }
}
