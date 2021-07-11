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

    private (set) var activePlayer: Player
    private (set) var gameState: GameState
    private (set) var winner: Player?

    init() {
        self.activePlayer = .X
        self.gameState = .playing
        self.winner = nil
    }
}
