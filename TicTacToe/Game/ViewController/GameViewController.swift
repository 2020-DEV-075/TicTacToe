//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Ananth Bhamidipati on 20/06/2020.
//  Copyright © 2020 2020-DEV-075. All rights reserved.
//

import UIKit

final class GameViewController: UIViewController {
    
    private var game: Game
    
    init(game: Game) {
        self.game = game
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Outlets
    
    @IBOutlet weak var tilesView: UIView!
    
    @IBOutlet weak var tilesHolderStackView: UIStackView!
    @IBOutlet weak var rowOneStackView: UIStackView!
    @IBOutlet weak var rowTwoStackView: UIStackView!
    @IBOutlet weak var rowThreeStackView: UIStackView!
    
    @IBOutlet var tileButtons: [UIButton]!
    
    @IBOutlet weak var infoLabel: UILabel!
    
    //MARK:- Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setDelegate()
    }
    
    //MARK:- Methods
    
    private func setDelegate() {
        game.delegate = self
    }
    
    private func setupUI() {
        self.navigationItem.title = "TicTacToe"
        
        let restartGameBarButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(replayButtonTapped))
        self.navigationItem.rightBarButtonItem = restartGameBarButton
        
        tilesHolderStackView.addBackground(color: .black)
    }
    
    //MARK:- Actions
    
    @objc func replayButtonTapped() {
        
    }
    
    @IBAction func tileAction(_ sender: UIButton) {
        guard let tileId = sender.accessibilityIdentifier else { return }
        game.play(tileId)
    }
}

extension GameViewController: GameControlDelegate {
    func markMove(position: String, player: Player, status: GameStatusInfo?) {
        
        guard let tile = tileButtons.first(where: { $0.accessibilityIdentifier == position }) else { fatalError() }
        guard status != .alreadyPlayed else { return }
        
        let tileMark = player == .playerX ? "X" : "O"
        tile.setTitle(tileMark, for: .normal)
    }
}
