// Created 11/07/2021

import Foundation

final class BoardViewModel {
    
    private (set) var game: GameProtocol!
    private (set) var gameLabelText: String = "Player X turn"
    private (set) var errorLabelText: String = ""
    private (set) var resetGameButtonCornerRadius: Int = 10
    private (set) var restartGameButtonText: String = "Play Again"

    init(game: GameProtocol) {
        self.game = game
    }
    
    var restartGameButtonIsHidden: Bool {
        return game.gameState == .playing
    }
    
    // MARK: - Playing Game
    
    func playerSelectedBoardValueAt(square: BoardButton) {
        updateBoardIfNoErrorsFound(square)
        updateGameLabelText()
    }
    
    func restartGame() {
        errorLabelText = ""
        gameLabelText = "Player X turn"
        game = GameFactory.game()
    }
    
    func resetBoardButtons(boardButtons: [BoardButton]) {
        boardButtons.forEach { $0.occupancy = .isEmpty }
    }
}

// MARK: - Private Helper Methods

private extension BoardViewModel {
    
    func updateBoardIfNoErrorsFound(_ square: BoardButton) {
        if updatedSelectedBoardValueWithoutErrors(index: square.tag-1) {
            square.occupancy = .isFilledBy(game.activePlayer)
            game.checkForWinner()
            game.checkForDraw()
            game.switchTurn()
        }
    }
    
    func updatedSelectedBoardValueWithoutErrors(index: Int) -> Bool {
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

    func updateGameLabelText() {
        gameLabelText = game.activePlayer.name + " turn"
        
        if game.gameState == .won {
            gameLabelText = game.winner!.name + " won"
        }
        if game.gameState == .draw {
            gameLabelText = "It's a draw"
        }
    }
}
