// Created 11/07/2021

import Foundation
@testable import TicTacToe

class GameMock: GameProtocol {

    var activePlayer = Player.X
    var gameState = GameState.playing
    var selectedBoardValues = [Int](repeating: 0, count: 9)
    var winner: Player?
    var updateSelectedBoardValueReceived: Int?
    var nextPlayer = Player.O
    var error: GameError?
    var checkForWinnerIsCalled: Bool = false

    func updateSelectedBoardValueAt(index: Int) throws {
        if error != nil { throw error! }

        updateSelectedBoardValueReceived = index
    }
    
    func checkForWinner() {
        checkForWinnerIsCalled = true
    }
    
    func checkForDraw() {
        //
    }
    
    func switchTurn() {
        activePlayer = nextPlayer
    }
}
