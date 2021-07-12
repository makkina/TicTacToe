// Created 11/07/2021

import Foundation

enum GameState {
    case playing
    case draw
    case won
}

enum GameError: Error {
    case indexOutOfRangeError
    case indexAlreadyPopulatedError
    case gameIsOverError
}

struct Game: GameProtocol {
    /*
     `selectedBoardValues` entries can have the following states:
        0 => Unselected
        1 => Selected by player X
        2 => Selected by player O
     */
    private (set) var selectedBoardValues: [Int]
    private (set) var activePlayer: Player
    private (set) var gameState: GameState
    private (set) var winner: Player?
    private let winningCombinations: [[Int]] = [
        // Horizontal
        [0, 1, 2], [3, 4, 5], [6, 7, 8],
        // Vertical
        [0, 3, 6], [1, 4, 7], [2, 5, 8],
        // Diagonal
        [0, 4, 8], [2, 4, 6]
    ]

    // MARK: - Init Game

    init(activePlayer: Player, selectedBoardValues: [Int], gameState: GameState) {
        self.selectedBoardValues = selectedBoardValues
        self.activePlayer = activePlayer
        self.gameState = gameState
    }
    
    // MARK: - Update Board
    
    mutating func updateSelectedBoardValueAt(index: Int) throws {
        if let e: GameError = gameErrorFound(index) { throw e }
        
        selectedBoardValues[index] = activePlayer.rawValue
    }
    
    // MARK: - Game Won
    
    mutating func checkForWinner() {
        if isWinningCombinationFound() {
            winner = activePlayer
            gameState = .won
        }
    }

    mutating func checkForDraw() {
        if isDrawFound() {
            gameState = .draw
        }
    }
    
    mutating func switchTurn() {
        activePlayer = activePlayer == .X ? .O : .X
    }
}

// MARK: - Private Helper Methods

private extension Game {
    
    func isWinningCombinationFound() -> Bool {
        let combination = winningCombinations.first {
            $0.allSatisfy { selectedBoardValues[$0] == activePlayer.rawValue }
        }
        return combination?.isEmpty == false
    }
    
    func isDrawFound() -> Bool {
        return selectedBoardValues.filter({ $0 == 0 }).isEmpty && gameState != .won
    }

    func isGameOver() -> Bool {
        return gameState == .won || gameState == .draw
    }
    
    func gameErrorFound(_ index: Int) -> GameError? {
        guard [0, 1, 2, 3, 4, 5, 6, 7, 8].contains(index) else {
            return GameError.indexOutOfRangeError
        }
        guard selectedBoardValues[index] == 0 else {
            return GameError.indexAlreadyPopulatedError
        }
        guard !isGameOver() else {
            return GameError.gameIsOverError
        }
        return nil
    }
}
