// Created 11/07/2021

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    private var game: Game!
    private var randomPlayer: Player!
    
    override func setUp() {
        super.setUp()
        game = GameFactory.game()
        randomPlayer = [Player.X, Player.O].randomElement()!
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
    
    // MARK: - Game Won: (Horizontal Combinations)

    func test_randomPlayerCanWin_givenTheFirstWinningHorizontalCombinationWasFound() {
        // given
        let x = randomPlayer.rawValue
        game = GameFactory.game(
            activePlayer: randomPlayer,
            selectedBoardValues: [
                x, x, x,
                0, 0, 0,
                0, 0, 0
            ])
        
        // when
        game.checkForWinner()
        
        // then
        XCTAssertEqual(randomPlayer, game.winner)
    }
    
    func test_randomPlayerCanWin_givenTheSecondWinningHorizontalCombinationWasFound() {
        // given
        let x = randomPlayer.rawValue
        game = GameFactory.game(
            activePlayer: randomPlayer,
            selectedBoardValues: [
                0, 0, 0,
                x, x, x,
                0, 0, 0
            ])
        
        // when
        game.checkForWinner()
        
        // then
        XCTAssertEqual(randomPlayer, game.winner)
    }
    
    func test_randomPlayerCanWin_givenTheThirdWinningHorizontalCombinationWasFound() {
        // given
        let x = randomPlayer.rawValue
        game = GameFactory.game(
            activePlayer: randomPlayer,
            selectedBoardValues: [
                0, 0, 0,
                0, 0, 0,
                x, x, x
            ])
        
        // when
        game.checkForWinner()
        
        // then
        XCTAssertEqual(randomPlayer, game.winner)
    }

    // MARK: - Game Won: (Vertical Combinations)
    
    func test_randomPlayerCanWin_givenTheFirstWinningVerticalCombinationWasFound() {
        // given
        let x = randomPlayer.rawValue
        game = GameFactory.game(
            activePlayer: randomPlayer,
            selectedBoardValues: [
                x, 0, 0,
                x, 0, 0,
                x, 0, 0
            ])
        
        // when
        game.checkForWinner()
        
        // then
        XCTAssertEqual(randomPlayer, game.winner)
    }
    
    func test_randomPlayerCanWin_givenTheSecondWinningVerticalCombinationWasFound() {
        // given
        let x = randomPlayer.rawValue
        game = GameFactory.game(
            activePlayer: randomPlayer,
            selectedBoardValues: [
                0, x, 0,
                0, x, 0,
                0, x, 0
            ])
        
        // when
        game.checkForWinner()
        
        // then
        XCTAssertEqual(randomPlayer, game.winner)
    }
    
    func test_randomPlayerCanWin_givenTheThirdWinningVerticalCombinationWasFound() {
        // given
        let x = randomPlayer.rawValue
        game = GameFactory.game(
            activePlayer: randomPlayer,
            selectedBoardValues: [
                0, 0, x,
                0, 0, x,
                0, 0, x
            ])
        
        // when
        game.checkForWinner()
        
        // then
        XCTAssertEqual(randomPlayer, game.winner)
    }
    
    // MARK: - Game Won: (Diagonal Combinations)
    
    func test_randomPlayerCanWin_givenTheFirstWinningDiagonalCombinationWasFound() {
        // given
        let x = randomPlayer.rawValue
        game = GameFactory.game(
            activePlayer: randomPlayer,
            selectedBoardValues: [
                x, 0, 0,
                0, x, 0,
                0, 0, x
            ])
        
        // when
        game.checkForWinner()
        
        // then
        XCTAssertEqual(randomPlayer, game.winner)
    }
    
    func test_randomPlayerCanWin_givenTheSecondWinningDiagonalCombinationWasFound() {
        // given
        let x = randomPlayer.rawValue
        game = GameFactory.game(
            activePlayer: randomPlayer,
            selectedBoardValues: [
                0, 0, x,
                0, x, 0,
                x, 0, 0
            ])
        
        // when
        game.checkForWinner()
        
        // then
        XCTAssertEqual(randomPlayer, game.winner)
    }

    // MARK: - Game Draw
    
    func test_canDraw_givenAllBoardValuesAreSelected() {
        // given
        game = GameFactory.game(
            selectedBoardValues: [
                1, 1, 2,
                2, 2, 1,
                1, 1, 2
            ])
        
        // when
        game.checkForDraw()
        
        // then
        XCTAssertEqual(GameState.draw, game.gameState)
    }
    
    func test_cannotDraw_givenTheGameHasBeenWon() {
        // given
        game = GameFactory.game(
            gameState: .won,
            selectedBoardValues: [1, 1, 1, 2, 2, 1, 1, 1, 2]
        )
        
        // when
        game.checkForDraw()
        
        // then
        XCTAssertNotEqual(GameState.draw, game.gameState)
    }
    
    // MARK: - Update Board
    
    func test_updateSelectedBoardValueWithPlayerSelection() {
        // given
        let x = randomPlayer.rawValue
        var game = GameFactory.game(activePlayer: randomPlayer)
        
        // when
        try? game.updateSelectedBoardValueAt(index: 4)
        
        // then
        let expectatedState = [
            0, 0, 0,
            0, x, 0,
            0, 0, 0
        ]
        XCTAssertEqual(expectatedState, game.selectedBoardValues)
    }
    
    // MARK: - Error Handling
    
    func test_givenInvalidIndex_throwIndexOutOfRangeError() {
        // when
        XCTAssertThrowsError(try game.updateSelectedBoardValueAt(index: -1)) {
            // then
            XCTAssertEqual($0 as? GameError, GameError.indexOutOfRangeError)
        }
    }
        
    func test_givenIndexAlreadyPopulated_throwIndexAlreadyPopulatedError() {
        // given
        let x = 0
        let index = 2
        game = GameFactory.game(selectedBoardValues: [x, x, 1, x, x, x, x, x, x])
        
        // when
        XCTAssertThrowsError(try game.updateSelectedBoardValueAt(index: index)) { error in
            // then
            XCTAssertEqual(error as? GameError, GameError.indexAlreadyPopulatedError)
        }
    }
}
