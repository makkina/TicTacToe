// Created 12/07/2021

import UIKit

final class BoardButton: UIButton {
    
    var symbolName: SymbolName? {
        didSet {
            setImage(symbolImage, for: .normal)
        }
    }
    
    private var symbolImage: UIImage? {
        UIImage.withSymbolName(symbolName?.rawValue ?? "")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.tintColor = .white
        self.layer.cornerRadius = 15
        self.symbolName = nil
    }
}

enum SymbolName: String {
    case xmark
    case circle
}
