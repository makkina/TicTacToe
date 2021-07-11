// Created 11/07/2021

import Foundation

enum Player {
    case X
    case O
}

struct Game {

    private (set) var activePlayer: Player
    
    init() {
        self.activePlayer = .X
    }
}
