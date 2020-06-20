//
//  Game.swift
//  TicTacToe
//
//  Created by Ananth Bhamidipati on 21/06/2020.
//  Copyright © 2020 2020-DEV-075. All rights reserved.
//

import Foundation


struct Game {
    
    private(set) var currentPlayer: Player
    private(set) var status: GameStatusInfo?
    
    init() {
        currentPlayer = .playerX
    }
    
    
 
}
