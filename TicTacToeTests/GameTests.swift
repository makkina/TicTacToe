// Created 11/07/2021

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    private var game: Game!
    
    override func setUp() {
        super.setUp()
        game = Game(
            activePlayer: .X,
            selectedBoardValues: [Int](repeating: 0, count: 9)
        )
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
     
    func test_playerOCanWinGame() {
        // given
        game = Game(activePlayer: .O, selectedBoardValues: [2, 2, 2, 0, 0, 0, 0, 0, 0])
        // when
        game.checkForWinner()
        // then
        XCTAssertEqual(Player.O, game.winner)
    }
    
    func test_playerXCanWin_givenTheFirstWinningHorizontalCombinationWasFound() {
        // given
        let activePlayer = Player.X
        let x = activePlayer.rawValue
        game = Game(
            activePlayer: activePlayer,
            selectedBoardValues: [
                x, x, x,
                0, 0, 0,
                0, 0, 0
            ])
        
        // when
        game.checkForWinner()
        
        // then
        XCTAssertEqual(activePlayer, game.winner)
    }
}
