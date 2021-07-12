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
    
    func playerSelectedBoardValueAt(square: BoardButton) {
        updateBoardIfNoErrorsFound(square)
        updateGameLabelText()
    }
}

// MARK: - Private Helper Methods

extension BoardViewModel {
    
    private func updateBoardIfNoErrorsFound(_ square: BoardButton) {
        if updatedSelectedBoardValueWithoutErrors(index: square.tag-1) {
            square.occupancy = .isFilledBy(game.activePlayer)
            game.checkForWinner()
            game.checkForDraw()
            game.switchTurn()
        }
    }
    
    private func updatedSelectedBoardValueWithoutErrors(index: Int) -> Bool {
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
        return errorLabelText == ""
    }

    private func updateGameLabelText() {
        gameLabelText = game.activePlayer.name + " turn"
        
        if game.gameState == .won {
            gameLabelText = game.winner!.name + " won"
        }
        if game.gameState == .draw {
            gameLabelText = "It's a draw"
        }
    }
}
