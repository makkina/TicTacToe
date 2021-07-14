// Created 12/07/2021

import UIKit

enum SymbolName: String {
    case Xmark = "xmark"
    case Circle = "circle"
}

final class BoardButton: UIButton {

    var symbolName: SymbolName? {
        didSet {
            setImage(UIImage.withSymbolName(symbolName?.rawValue ?? ""), for: .normal)
        }
    }
    
    // MARK: - Init
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.tintColor = .white
        self.layer.cornerRadius = 15
    }
}
