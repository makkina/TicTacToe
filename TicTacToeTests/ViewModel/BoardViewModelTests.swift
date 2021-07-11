// Created 11/07/2021

import XCTest
@testable import TicTacToe

class BoardViewModelTests: XCTestCase {
    
    private var viewModel: BoardViewModel!

    override func setUp() {
        viewModel = BoardViewModel(game: Game(
            activePlayer: .X,
            selectedBoardValues: [Int](repeating: 0, count: 9),
            gameState: .playing
        ))
    }
    
    // MARK: - Initialising BoardViewModel
    
    func test_setsGameToNotNil() {
        XCTAssertNotNil(viewModel.game)
    }
}
