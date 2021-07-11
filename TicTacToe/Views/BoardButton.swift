// Created 12/07/2021

import UIKit

enum Occupancy {
    case isEmpty
    case isFilled
}

class BoardButton: UIButton {

    var occupancy: Occupancy = .isEmpty
}
