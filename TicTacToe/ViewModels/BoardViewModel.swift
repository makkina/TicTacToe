// Created 11/07/2021

import Foundation

final class BoardViewModel {
    
    private (set) var game: GameProtocol!
    private (set) var restartGameButtonIsHidden: Bool! = true
    private (set) var gameLabelText: String = "Player X turn"

    init(game: GameProtocol) {
        self.game = game
    }
}
