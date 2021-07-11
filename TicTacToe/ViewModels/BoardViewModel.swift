// Created 11/07/2021

import Foundation
import UIKit

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
        let index = square.tag-1
        tryUpdateSelectedBoardValue(index)
        square.occupancy = .isFilled
        square.setImage(UIImage(
                            systemName: "xmark",
                            withConfiguration: UIImage.SymbolConfiguration(pointSize: 50)), for: .normal)
        game.checkForWinner()
        game.checkForDraw()
        game.switchTurn()
        updateGameLabelText()
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
