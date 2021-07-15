// Created 11/07/2021

import UIKit

final class BoardViewController: UIViewController {
    
    private var viewModel: BoardViewModel = BoardViewModel(game: GameFactory.game())
    
    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var resetGameButton: ResetGameButton!
    @IBOutlet var allBoardButtons: [BoardButton]!
    
    // MARK: - Actions
    
    @IBAction func resetGameButtonPressed(_ sender: ResetGameButton) {
        viewModel.restartGame()
        viewModel.resetBoardButtons(boardButtons: allBoardButtons)
        updateView()
    }
    
    @IBAction func boardButtonPressed(_ boardButton: BoardButton) {
        viewModel.playerSelectedBoardValueAt(square: boardButton)
        updateView()
    }
    
    // MARK: - Setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        allBoardButtons.forEach {
            $0.accessibilityIdentifier = "boardButton \($0.tag)"
        }
    }
    
    private func updateView() {
        gameLabel.text = viewModel.gameLabelText
        errorLabel.text = viewModel.errorLabelText
        resetGameButton.isHidden = viewModel.restartGameButtonIsHidden
    }
}
