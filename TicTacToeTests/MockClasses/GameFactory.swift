// Created 11/07/2021

import Foundation
@testable import TicTacToe

struct GameFactory {

    static func game(
        activePlayer: Player = .X,
        gameState: GameState = .playing,
        selectedBoardValues: [Int] = [Int](repeating: 0, count: 9),
        winner: Player? = nil
    ) -> Game {
        
        return Game(
            activePlayer: activePlayer,
            selectedBoardValues: selectedBoardValues,
            gameState: gameState,
            winner: winner ?? nil
        )
    }
}
