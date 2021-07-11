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

    func updateSelectedBoardValueAt(index: Int) throws {
        updateSelectedBoardValueReceived = index
    }
    
    func checkForWinner() {
        //
    }
    
    func checkForDraw() {
        //
    }
    
    func switchTurn() {
        activePlayer = nextPlayer
    }
}
