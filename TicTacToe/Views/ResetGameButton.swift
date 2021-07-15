// Created 14/07/2021

import UIKit

final class ResetGameButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setTitle("Play Again", for: .normal)
        self.layer.cornerRadius = 10
        self.accessibilityIdentifier = "resetGameButtonIdentifier"
    }
}
