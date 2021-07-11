// Created 11/07/2021

import Foundation

enum Player {
    case X
    case O
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
    
    init(activePlayer: Player) {
        self.activePlayer = activePlayer
        self.gameState = .playing
        self.winner = nil
        self.selectedBoardValues = [Int](repeating: 0, count: 9)
    }
    
    // MARK: - Game Won
    
    mutating func checkForWinner() {
        winner = activePlayer
    }
}