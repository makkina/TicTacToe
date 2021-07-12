// Created 12/07/2021

import UIKit

enum Occupancy: Equatable {
    case isEmpty
    case isFilledBy(Player)
    
    var image: UIImage? {
        switch self {
        case .isFilledBy(let p):
            return UIImage.withSymbolName(p.symbolName)
        default:
            return nil
        }
    }
}

class BoardButton: UIButton {

    var occupancy: Occupancy = .isEmpty {
        didSet {
            setImage(occupancy.image, for: .normal)
        }
    }
    
    // MARK: - Init
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 15
    }
}
