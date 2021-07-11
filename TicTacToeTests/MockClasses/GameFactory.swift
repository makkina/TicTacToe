// Created 11/07/2021

import Foundation
@testable import TicTacToe

struct GameFactory {

    static func game(
        activePlayer: Player = .X,
        selectedBoardValues: [Int] = [Int](repeating: 0, count: 9),
        gameState: GameState = .playing,
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
