// Created 12/07/2021

import UIKit

enum SymbolName: String {
    case xmark
    case circle
    
    var image: UIImage? {
        UIImage.withSymbolName(rawValue)
    }
}

final class BoardButton: UIButton {

    var symbolName: SymbolName? {
        didSet {
            setImage(symbolName?.image, for: .normal)
        }
    }
    
    // MARK: - Init
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.tintColor = .white
        self.layer.cornerRadius = 15
    }
}
