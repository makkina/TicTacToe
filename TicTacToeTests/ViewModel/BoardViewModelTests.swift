// Created 11/07/2021

import XCTest
@testable import TicTacToe

class BoardViewModelTests: XCTestCase {
    
    private var gameMock: GameMock!
    private var viewModel: BoardViewModel!

    override func setUp() {
        gameMock = GameFactory.gameMock()
        viewModel = BoardViewModel(game: gameMock)
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
    
    func test_givenPlayerSelects4_viewModelCanSendSelectionToGame() {
        // given
        let index = 4
        
        // when
        viewModel.playerSelectedBoardValueAt(index: index)
        
        // then
        XCTAssertEqual(index, gameMock.updateSelectedBoardValueReceived)
    }
    
    func test_givenPlayerSelectsBetween0And8_viewModelCanSendSelectionToGame() {
        // given
        let index = Int.random(in: 0...8)
        
        // when
        viewModel.playerSelectedBoardValueAt(index: index)
        
        // then
        XCTAssertEqual(index, gameMock.updateSelectedBoardValueReceived)
    }
}
