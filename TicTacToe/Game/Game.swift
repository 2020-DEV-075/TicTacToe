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
    
    private var overallPlayedPositions = Set<String>()
    
    private var playerXMoves = Set<String>()
    private var playerOMoves = Set<String>()
    
    private let possibleWinPositions = [["11","21","31"],["12","22","32"],["13","23","33"],["11","12","13"],["21","22","23"],["31","32","33"],["11","22","33"],["13","22","31"]]
    
    var delegate: GameControlDelegate?
    
    //MARK:- Init
    
    init() {
        currentPlayer = .playerX
    }
    
    //MARK:- Game play helper Methods
    
    private mutating func toggleCurrentPlayer() {
        currentPlayer = currentPlayer == .playerX ? .playerO : .playerX
    }
    
    private mutating func addPlayerMove(_ position: String) {
        status = .markMove
        overallPlayedPositions.insert(position)
        
        switch currentPlayer {
        case .playerX:
            playerXMoves.insert(position)
        case .playerO:
            playerOMoves.insert(position)
        }
        
        delegate?.markMove(position: position, player: currentPlayer, status: status)
    }
    
    private mutating func checkGameStatus() {
        let playerMoves = currentPlayer == .playerX ? playerXMoves : playerOMoves
        
        //If a user has less than 3 moves, they have no chance of win, so we return and ask for nextMove
        guard playerMoves.count >= 3 else {
            status = .nextMove
            toggleCurrentPlayer()
            return
        }
        
        
        possibleWinPositions.forEach { (possibleWinPosition) in
            let commonElements = possibleWinPosition.filter(playerMoves.contains)
            
            let didWin = commonElements.count == 3
            if didWin {
                status = .won
                return
            }
        }
        
        if status != .won {
            if overallPlayedPositions.count == 9 {
                status = .draw
                return
            }
            toggleCurrentPlayer()
        }
    }
    
    //MARK:- Game play Methods
    
    public mutating func play(_ position: String) {
        guard !overallPlayedPositions.contains(position) else {
            status = .alreadyPlayed
            delegate?.markMove(position: position, player: currentPlayer, status: status)
            return
        }
        
        addPlayerMove(position)
        checkGameStatus()
    }
 
}

//MARK:- Game Protocol

protocol GameControlDelegate {
    func markMove(position: String, player: Player, status: GameStatusInfo?)
}

