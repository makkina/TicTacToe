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
        tryUpdateSelectedBoardValue(index)
        game.checkForWinner()
        game.checkForDraw()
        game.switchTurn()
        gameLabelText = game.activePlayer.name + " turn"
        
        if game.gameState == .won {
            gameLabelText = game.winner!.name + " won"
        }
    }
}

// MARK: - Private Helper Methods

extension BoardViewModel {
    
    private func tryUpdateSelectedBoardValue(_ index: Int) {
        errorLabelText = ""
        do {
            try game.updateSelectedBoardValueAt(index: index)
        } catch GameError.gameIsOverError {
            errorLabelText = "Invalid entry, game is over"
        } catch GameError.indexOutOfRangeError {
            errorLabelText = "Invalid entry, unrecognized value"
        } catch GameError.indexAlreadyPopulatedError {
            errorLabelText = "Invalid entry, please try again"
        } catch {
            errorLabelText = ""
        }
    }
}
