// Created 11/07/2021

import Foundation

enum Player: Int {
    case X = 1
    case O = 2
}

enum GameState {
    case playing
    case draw
    case won
}

struct Game {

    // MARK: - Init Game
    
    private (set) var activePlayer: Player
    private (set) var selectedBoardValues: [Int]
    private (set) var gameState: GameState
    private (set) var winner: Player?

    init(activePlayer: Player, selectedBoardValues: [Int], gameState: GameState, winner: Player? = nil) {
        self.selectedBoardValues = selectedBoardValues
        self.activePlayer = activePlayer
        self.gameState = gameState
        self.winner = winner
    }
    
    // MARK: - Game Won
    
    mutating func checkForWinner() {
        if isWinningCombinationFound() {
            winner = activePlayer
        }
    }
    
    private func isWinningCombinationFound() -> Bool {
        let horizontalCombinations: [[Int]] = [[0, 1, 2], [3, 4, 5]]
        var combinationFound = false
        
        for c in horizontalCombinations where combinationFound == false {
            combinationFound = c.allSatisfy {
                selectedBoardValues[$0] == activePlayer.rawValue
            }
        }
        return combinationFound == true
    }
}
