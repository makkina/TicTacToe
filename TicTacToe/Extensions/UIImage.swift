// Created 12/07/2021

import UIKit

extension UIImage {
    
    static func withSymbolName(_ symbolName: String) -> UIImage? {
        return UIImage(
            systemName: symbolName,
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 50)
        )
    }
}
