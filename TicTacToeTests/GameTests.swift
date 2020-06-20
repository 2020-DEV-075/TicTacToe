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

    func testInitialPlayer() {
        let result = game.currentPlayer
        XCTAssertEqual(result, .playerX)
    }
    
    func testPlayerChange() {
        game.play("11")
        let result = game.currentPlayer
        XCTAssertEqual(result, .playerO)
    }
    
    func testPlayerChangeAfterTwoMovies() {
        game.play("11")
        game.play("12")
        let result = game.currentPlayer
        XCTAssertEqual(result, .playerX)
    }
    
    func testMoveOnAlreadyPlayedPosition() {
        game.play("11")
        game.play("11")
        let result = game.status
        XCTAssertEqual(result, .alreadyPlayed)
    }
    
    func testWinDiagonal() {
        game.play("11")
        game.play("21")
        game.play("22")
        game.play("31")
        game.play("33")
        let result = game.status
        XCTAssertEqual(result, .won)
    }
    
    func testWinHorizontal() {
        game.play("11")
        game.play("21")
        game.play("12")
        game.play("31")
        game.play("13")
        let result = game.status
        XCTAssertEqual(result, .won)
    }
    
    func testWinVertical() {
        game.play("11")
        game.play("12")
        game.play("21")
        game.play("33")
        game.play("31")
        let result = game.status
        XCTAssertEqual(result, .won)
    }
    
    func testDraw() {
        game.play("31")
        game.play("21")
        game.play("12")
        game.play("11")
        game.play("22")
        game.play("32")
        game.play("33")
        game.play("13")
        game.play("23")
        let result = game.status
        XCTAssertEqual(result, .draw)
    }

}
