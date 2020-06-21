//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Ananth Bhamidipati on 20/06/2020.
//  Copyright © 2020 2020-DEV-075. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    var game: Game?
    
    override func setUp() {
        game = Game()
    }

    override func tearDown() {
        game = nil
    }
    
    //MARK:- Current player tests

    func testInitialPlayer() {
        let result = game?.currentPlayer
        XCTAssertEqual(result, .playerX)
    }
    
    func testPlayerChange() {
        game?.play("11")
        let result = game?.currentPlayer
        XCTAssertEqual(result, .playerO)
    }
    
    func testPlayerChangeAfterTwoMovies() {
        game?.play("11")
        game?.play("12")
        let result = game?.currentPlayer
        XCTAssertEqual(result, .playerX)
    }
    
    //MARK:- Already played position tests
    
    func testMoveOnAlreadyPlayedPosition() {
        game?.play("11")
        game?.play("11")
        let result = game?.status
        XCTAssertEqual(result, .alreadyPlayed)
    }
    
    //MARK:- PlayerX win tests

    func testPlayerXWinDiagonal() {
        game?.play("11")
        game?.play("21")
        game?.play("22")
        game?.play("31")
        game?.play("33")
        let result = game?.status
        XCTAssertEqual(result, .won)
        
        let currentPlayer = game?.currentPlayer
        XCTAssertEqual(currentPlayer, .playerX)
    }

    func testPlayerXWinHorizontal() {
        game?.play("11")
        game?.play("21")
        game?.play("12")
        game?.play("31")
        game?.play("13")
        let result = game?.status
        XCTAssertEqual(result, .won)
        
        let currentPlayer = game?.currentPlayer
        XCTAssertEqual(currentPlayer, .playerX)
    }

    func testPlayerXWinVertical() {
        game?.play("11")
        game?.play("12")
        game?.play("21")
        game?.play("33")
        game?.play("31")
        let result = game?.status
        XCTAssertEqual(result, .won)
        
        let currentPlayer = game?.currentPlayer
        XCTAssertEqual(currentPlayer, .playerX)
    }
    
    //MARK:- PlayerO win tests
    
    func testPlayerOWinDiagonal() {
        game?.play("21")
        game?.play("11")
        game?.play("31")
        game?.play("22")
        game?.play("13")
        game?.play("33")
        let result = game?.status
        XCTAssertEqual(result, .won)
        
        let currentPlayer = game?.currentPlayer
        XCTAssertEqual(currentPlayer, .playerO)
    }

    func testPlayerOWinHorizontal() {
        game?.play("21")
        game?.play("11")
        game?.play("31")
        game?.play("12")
        game?.play("32")
        game?.play("13")
        let result = game?.status
        XCTAssertEqual(result, .won)
        
        let currentPlayer = game?.currentPlayer
        XCTAssertEqual(currentPlayer, .playerO)
    }

    func testPlayerOWinVertical() {
        game?.play("12")
        game?.play("11")
        game?.play("33")
        game?.play("21")
        game?.play("32")
        game?.play("31")
        let result = game?.status
        XCTAssertEqual(result, .won)
        
        let currentPlayer = game?.currentPlayer
        XCTAssertEqual(currentPlayer, .playerO)
    }
    
    //MARK:- Draw tests

    func testDraw() {
        game?.play("31")
        game?.play("21")
        game?.play("12")
        game?.play("11")
        game?.play("22")
        game?.play("32")
        game?.play("33")
        game?.play("13")
        game?.play("23")
        let result = game?.status
        XCTAssertEqual(result, .draw)
    }

}
