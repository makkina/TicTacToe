// Created 11/07/2021

import XCTest
@testable import TicTacToe

class BoardViewModelTests: XCTestCase {
    
    func test_canCreateBoardViewModel() {
        let viewModel = BoardViewModel()
    }
    
    // MARK: - Initialising BoardViewModel
    
    func test_setsGameToNotNil() {
        let viewModel = BoardViewModel()
        
        XCTAssertNotNil(viewModel.game)
    }
}
