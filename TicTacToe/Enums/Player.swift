// Created 11/07/2021

import Foundation

enum Player: Int {
    case X = 1
    case O = 2
    
    var name: String {
        switch self {
        case .X:
            return "Player X"
        case .O:
            return "Player O"
        }
    }
    
    var symbolName: String {
         switch self {
         case .X:
             return "xmark"
         case .O:
             return "circle"
         }
     }
}
