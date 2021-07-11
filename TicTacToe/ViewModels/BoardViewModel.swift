// Created 11/07/2021

import Foundation

final class BoardViewModel {
    
    private (set) var game: GameProtocol!
    private (set) var restartGameButtonIsHidden: Bool = true
    private (set) var gameLabelText: String = "Player X turn"
    private (set) var errorLabelText: String = ""

    init(game: GameProtocol) {
        self.game = game
    }
    
    // MARK: - Playing Game
    
    func playerSelectedBoardValueAt(index: Int) {
        do {
            try game.updateSelectedBoardValueAt(index: index)
        } catch {
            errorLabelText = "Invalid entry, game is over"
        }
        game.switchTurn()
        gameLabelText = game.activePlayer.name + " turn"
    }
}
