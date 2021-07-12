// Created 11/07/2021

import UIKit

class BoardViewController: UIViewController {
    
    @IBOutlet weak var gameLabel: UILabel!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var resetGameButton: UIButton!
    
    @IBOutlet var allBoardButtons: [BoardButton]!
    
    @IBAction func resetGameButtonPressed(_ sender: Any) {
        
    }

    // MARK: - Setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
