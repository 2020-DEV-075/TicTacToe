//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Ananth Bhamidipati on 20/06/2020.
//  Copyright © 2020 2020-DEV-075. All rights reserved.
//

import UIKit

final class GameViewController: UIViewController {
    
    init() {
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
    }
    
    //MARK:- Methods
    
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
    }
    

}
