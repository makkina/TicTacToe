// Created 12/07/2021

import Foundation

struct GameFactory {
    
    static func game(
        activePlayer: Player = .X,
        gameState: GameState = .playing,
        selectedBoardValues: [Int] = [Int](repeating: 0, count: 9)
    ) -> Game {
        
        return Game(
            activePlayer: activePlayer,
            selectedBoardValues: selectedBoardValues,
            gameState: gameState
        )
    }
}
