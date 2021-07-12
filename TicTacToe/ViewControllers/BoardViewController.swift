// Created 11/07/2021

import UIKit

final class BoardViewController: UIViewController {
    
    private var viewModel: BoardViewModel = BoardViewModel(game: GameFactory.game())
    
    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var resetGameButton: UIButton!
    @IBOutlet var allBoardButtons: [BoardButton]!
    
    // MARK: - Actions
    
    @IBAction func resetGameButtonPressed(_ sender: UIButton) {
        viewModel.restartGame()
        setupView()
    }
    
    @IBAction func boardButtonPressed(_ boardButton: BoardButton) {
        viewModel.playerSelectedBoardValueAt(square: boardButton)
        updateView()
    }
    
    // MARK: - Setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        updateView()
        viewModel.resetBoardButtons(boardButtons: allBoardButtons)
        resetGameButton.setTitle(viewModel.restartGameButtonText, for: .normal)
        resetGameButton.layer.cornerRadius = CGFloat(viewModel.resetGameButtonCornerRadius)
    }
    
    private func updateView() {
        gameLabel.text = viewModel.gameLabelText
        errorLabel.text = viewModel.errorLabelText
        resetGameButton.isHidden = viewModel.restartGameButtonIsHidden
    }
}
