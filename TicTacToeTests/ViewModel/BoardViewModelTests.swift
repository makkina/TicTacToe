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
}
