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
    
    @IBOutlet weak var tilesView: UIView!
    @IBOutlet weak var tilesHolderStackView: UIStackView!
    @IBOutlet var tileButtons: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
