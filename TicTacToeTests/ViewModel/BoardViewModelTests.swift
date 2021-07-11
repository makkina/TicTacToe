// Created 11/07/2021

import XCTest
@testable import TicTacToe

class BoardViewModelTests: XCTestCase {
    
    private var gameMock: GameMock!
    private var viewModel: BoardViewModel!
    private var randomValidSelection: Int!
    
    override func setUp() {
        gameMock = GameFactory.gameMock()
        viewModel = BoardViewModel(game: gameMock)
        randomValidSelection = Int.random(in: 0...8)
    }
    
    // MARK: - Initialising BoardViewModel
    
    func test_setsGameToNotNil() {
        XCTAssertNotNil(viewModel.game)
    }
    
    func test_setsRestartGameButtonIsHiddenToTrue() {
        XCTAssertTrue(viewModel.restartGameButtonIsHidden)
    }
    
    func test_setsGameLabelTextToPlayerXTurn() {
        XCTAssertEqual(viewModel.gameLabelText, "Player X turn")
    }
    
    func test_setsErrorLabelTextToEmptyString() {
        XCTAssertEqual(viewModel.errorLabelText, "")
    }
    
    // MARK: - Playing Game

    func test_givenPlayerSelectsBetween0And8_viewModelCanSendSelectionToGame() {
        viewModel.playerSelectedBoardValueAt(index: randomValidSelection)
        
        XCTAssertEqual(randomValidSelection, gameMock.updateSelectedBoardValueReceived)
    }
    
    func test_givenPlayerXMadeASelection_gameLabelTextWillDisplayPlayerOTurn() {
        // given
        gameMock.activePlayer = .X
        gameMock.nextPlayer = .O

        // when
        viewModel.playerSelectedBoardValueAt(index: randomValidSelection)

        // then
        XCTAssertEqual(viewModel.gameLabelText, "Player O turn")
    }
    
    func test_givenPlayerOMadeASelection_gameLabelTextWillDisplayPlayerXTurn() {
        // given
        gameMock.activePlayer = .O
        gameMock.nextPlayer = .X

        // when
        viewModel.playerSelectedBoardValueAt(index: randomValidSelection)

        // then
        XCTAssertEqual(viewModel.gameLabelText, "Player X turn")
    }

    // MARK: - Check of Game is Over
    
    func test_checkForWinnerIsCalledAfterEveryPlayerSelection() {
        gameMock.checkForWinnerIsCalled = false
        
        viewModel.playerSelectedBoardValueAt(index: randomValidSelection)
        
        XCTAssertTrue(gameMock.checkForWinnerIsCalled)
    }
    
    func test_checkForDrawIsCalledAfterEveryPlayerSelection() {
        gameMock.checkForDrawIsCalled = false
        
        viewModel.playerSelectedBoardValueAt(index: randomValidSelection)
        
        XCTAssertTrue(gameMock.checkForDrawIsCalled)
    }

    // MARK: - Game is Over
    
    func test_givenPlayerXWon_gameLabelTextReadsPlayerXWon() {
        // given
        gameMock.gameState = .won
        gameMock.winner = Player.X
        
        // when
        viewModel.playerSelectedBoardValueAt(index: randomValidSelection)
        
        // then
        XCTAssertEqual(viewModel.gameLabelText, "Player X won")
    }
    
    // @todo: Reset game
}

// MARK: - Error Handling

extension BoardViewModelTests {
    
    func test_givenGameIsOverErrorWasThrown_errorLabelTextDisplayInvalidEntry() {
        // given
        gameMock.error = .gameIsOverError
    
        // when
        viewModel.playerSelectedBoardValueAt(index: randomValidSelection)
        
        // then
        XCTAssertEqual(viewModel.errorLabelText, "Invalid entry, game is over")
    }
    
    func test_givenIndexOutOfRangeErrorWasThrown_errorLabelTextDisplayInvalidEntry() {
        // given
        gameMock.error = .indexOutOfRangeError
    
        // when
        viewModel.playerSelectedBoardValueAt(index: randomValidSelection)
        
        // then
        XCTAssertEqual(viewModel.errorLabelText, "Invalid entry, unrecognized value")
    }
    
    func test_givenIndexAlreadyPopulatedErrorWasThrown_errorLabelTextDisplayInvalidEntry() {
        // given
        gameMock.error = .indexAlreadyPopulatedError
    
        // when
        viewModel.playerSelectedBoardValueAt(index: randomValidSelection)
        
        // then
        XCTAssertEqual(viewModel.errorLabelText, "Invalid entry, please try again")
    }
}
