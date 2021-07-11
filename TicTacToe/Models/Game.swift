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
    private (set) var gameState: GameState
    private (set) var winner: Player?
    private (set) var selectedBoardValues: [Int]
    
    init(activePlayer: Player, selectedBoardValues: [Int]) {
        self.activePlayer = activePlayer
        self.gameState = .playing
        self.winner = nil
        self.selectedBoardValues = selectedBoardValues
    }
    
    // MARK: - Game Won
    
    mutating func checkForWinner() {
        let firstWinningHorizontalCombination: [Int] = [0, 1, 2]
        
        if selectedBoardValues[firstWinningHorizontalCombination[0]] == activePlayer.rawValue &&
            selectedBoardValues[firstWinningHorizontalCombination[1]] == activePlayer.rawValue &&
            selectedBoardValues[firstWinningHorizontalCombination[2]] == activePlayer.rawValue {
            winner = activePlayer
        }
    }
}
