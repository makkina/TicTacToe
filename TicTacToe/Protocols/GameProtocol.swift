// Created 11/07/2021

import Foundation

protocol GameProtocol {
    mutating func updateSelectedBoardValueAt(index: Int) throws
    mutating func checkForWinner()
    mutating func checkForDraw()
    mutating func switchTurn()
}
