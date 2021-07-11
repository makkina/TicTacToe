// Created 11/07/2021

import Foundation

protocol GameProtocol {
    var activePlayer: Player { get }
    
    mutating func updateSelectedBoardValueAt(index: Int) throws
    mutating func checkForWinner()
    mutating func checkForDraw()
    mutating func switchTurn()
}
