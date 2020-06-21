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
        
        //If a user has less than 3 moves, they have no chance of winning so we return.
        guard playerMoves.count >= 3 else {
            toggleCurrentPlayer()
            status = .nextMove
            delegate?.gameStatus(player: currentPlayer, status: status, gamePositions: overallPlayedPositions)
            return
        }
        
        possibleWinPositions.forEach { (possibleWinPosition) in
            let commonElements = Set(possibleWinPosition.filter(playerMoves.contains))
            
            let didWin = commonElements.count == 3
            if didWin {
                status = .won
                delegate?.gameStatus(player: currentPlayer, status: status, gamePositions: commonElements)
                return
            }
        }
        
        if status != .won {
            if overallPlayedPositions.count == 9 {
                status = .draw
                delegate?.gameStatus(player: currentPlayer, status: status, gamePositions: overallPlayedPositions)
                return
            }
            
            status = .nextMove
            toggleCurrentPlayer()
            delegate?.gameStatus(player: currentPlayer, status: status, gamePositions: overallPlayedPositions)
        }
    }
    
    //MARK:- Game play Public Methods
    
    public mutating func play(_ position: String) {
        guard !overallPlayedPositions.contains(position) else {
            status = .alreadyPlayed
            delegate?.markMove(position: position, player: currentPlayer, status: status)
            return
        }
        
        addPlayerMove(position)
        checkGameStatus()
    }
    
    public mutating func reset() {
        currentPlayer = .playerX
        status = nil
        overallPlayedPositions = []
        playerOMoves = []
        playerXMoves = []
    }
 
}

//MARK:- Game Protocol

protocol GameControlDelegate {
    func markMove(position: String, player: Player, status: GameStatusInfo?)
    func gameStatus(player: Player, status: GameStatusInfo?, gamePositions: Set<String>)
}

