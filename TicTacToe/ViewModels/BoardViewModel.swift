// Created 11/07/2021

import Foundation

final class BoardViewModel {
    
    private (set) var game: GameProtocol!
    
    init(game: GameProtocol) {
        self.game = game
    }
}
