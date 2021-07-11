// Created 11/07/2021

import Foundation

final class BoardViewModel {
    
    private (set) var game: GameProtocol! = Game(
        activePlayer: .X,
        selectedBoardValues: [Int](repeating: 0, count: 9),
        gameState: .playing
    )
}
