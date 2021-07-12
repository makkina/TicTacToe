// Created 12/07/2021

import UIKit

enum Occupancy: Equatable {
    case isEmpty
    case isFilledBy(Player)
}

class BoardButton: UIButton {

    var occupancy: Occupancy = .isEmpty {
        didSet {
            setImage(UIImage.withSymbolName("xmark"), for: .normal)
        }
    }
}
