// Created 11/07/2021

import XCTest
@testable import TicTacToe

class BoardViewModelTests: XCTestCase {
    
    private var viewModel: BoardViewModel!

    override func setUp() {
        viewModel = BoardViewModel(game: GameFactory.game())
    }
    
    // MARK: - Initialising BoardViewModel
    
    func test_setsGameToNotNil() {
        XCTAssertNotNil(viewModel.game)
    }
}
