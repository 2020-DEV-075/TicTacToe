//
//  GameViewControllerTests.swift
//  TicTacToeTests
//
//  Created by Ananth Bhamidipati on 21/06/2020.
//  Copyright © 2020 2020-DEV-075. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameViewControllerTests: XCTestCase {
    
    var gameViewController: GameViewController!
    

    override func setUp() {
        let gameVC = GameViewController(game: Game())
        gameViewController = gameVC
        _ = gameViewController.view
    }

    override func tearDown() {
        
    }
    
    //MARK:- InfoLabel tests
    
    func testInfoLabelUserInitialText() {
        let text = gameViewController.infoLabel.text
        XCTAssertEqual(text, "Player X's turn!")
    }
    
    func testInfoLabelChangeUserText() {
        gameViewController.tileButtons.first?.sendActions(for: .touchUpInside)
        let text = gameViewController.infoLabel.text
        XCTAssertEqual(text, "Player O's turn!")
    }
    
    func testInfoLabelPlayerXWinText() {
        
        let tile11 = gameViewController.tileButtons.first(where: { $0.accessibilityIdentifier == "11" })
        tile11?.sendActions(for: .touchUpInside)
        
        let tile21 = gameViewController.tileButtons.first(where: { $0.accessibilityIdentifier == "21" })
        tile21?.sendActions(for: .touchUpInside)
        
        let tile12 = gameViewController.tileButtons.first(where: { $0.accessibilityIdentifier == "12" })
        tile12?.sendActions(for: .touchUpInside)
        
        let tile31 = gameViewController.tileButtons.first(where: { $0.accessibilityIdentifier == "31" })
        tile31?.sendActions(for: .touchUpInside)
        
        let tile13 = gameViewController.tileButtons.first(where: { $0.accessibilityIdentifier == "13" })
        tile13?.sendActions(for: .touchUpInside)
        
        let text = gameViewController.infoLabel.text
        XCTAssertEqual(text, "Player X has won the game")
    }
    
    func testInfoLabelPlayerOWinText() {
        let tile12 = gameViewController.tileButtons.first(where: { $0.accessibilityIdentifier == "12" })
        tile12?.sendActions(for: .touchUpInside)
        
        let tile11 = gameViewController.tileButtons.first(where: { $0.accessibilityIdentifier == "11" })
        tile11?.sendActions(for: .touchUpInside)
        
        let tile33 = gameViewController.tileButtons.first(where: { $0.accessibilityIdentifier == "33" })
        tile33?.sendActions(for: .touchUpInside)
        
        let tile21 = gameViewController.tileButtons.first(where: { $0.accessibilityIdentifier == "21" })
        tile21?.sendActions(for: .touchUpInside)
        
        let tile32 = gameViewController.tileButtons.first(where: { $0.accessibilityIdentifier == "32" })
        tile32?.sendActions(for: .touchUpInside)
        
        let tile31 = gameViewController.tileButtons.first(where: { $0.accessibilityIdentifier == "31" })
        tile31?.sendActions(for: .touchUpInside)
        
        let text = gameViewController.infoLabel.text
        XCTAssertEqual(text, "Player O has won the game")
    }
    
    func testInfoLabelDrawText() {
        let tile31 = gameViewController.tileButtons.first(where: { $0.accessibilityIdentifier == "31" })
        tile31?.sendActions(for: .touchUpInside)
        
        let tile21 = gameViewController.tileButtons.first(where: { $0.accessibilityIdentifier == "21" })
        tile21?.sendActions(for: .touchUpInside)
        
        let tile12 = gameViewController.tileButtons.first(where: { $0.accessibilityIdentifier == "12" })
        tile12?.sendActions(for: .touchUpInside)
        
        let tile11 = gameViewController.tileButtons.first(where: { $0.accessibilityIdentifier == "11" })
        tile11?.sendActions(for: .touchUpInside)
        
        let tile22 = gameViewController.tileButtons.first(where: { $0.accessibilityIdentifier == "22" })
        tile22?.sendActions(for: .touchUpInside)
        
        let tile32 = gameViewController.tileButtons.first(where: { $0.accessibilityIdentifier == "32" })
        tile32?.sendActions(for: .touchUpInside)
        
        let tile33 = gameViewController.tileButtons.first(where: { $0.accessibilityIdentifier == "33" })
        tile33?.sendActions(for: .touchUpInside)
        
        let tile13 = gameViewController.tileButtons.first(where: { $0.accessibilityIdentifier == "13" })
        tile13?.sendActions(for: .touchUpInside)
        
        let tile23 = gameViewController.tileButtons.first(where: { $0.accessibilityIdentifier == "23" })
        tile23?.sendActions(for: .touchUpInside)
        
        let text = gameViewController.infoLabel.text
        XCTAssertEqual(text, "Game draw!")
    }
    
    
    //MARK:- Tile Text tests
    
    func testTileText() {
        let tile11 = gameViewController.tileButtons.first(where: { $0.accessibilityIdentifier == "11" })
        tile11?.sendActions(for: .touchUpInside)
        let text11 = tile11?.titleLabel?.text
        XCTAssertEqual(text11, "X")
        
        let tile21 = gameViewController.tileButtons.first(where: { $0.accessibilityIdentifier == "21" })
        tile21?.sendActions(for: .touchUpInside)
        let text21 = tile21?.titleLabel?.text
        XCTAssertEqual(text21, "O")
        
        let tile12 = gameViewController.tileButtons.first(where: { $0.accessibilityIdentifier == "12" })
        tile12?.sendActions(for: .touchUpInside)
        let text12 = tile12?.titleLabel?.text
        XCTAssertEqual(text12, "X")
        
        let tile31 = gameViewController.tileButtons.first(where: { $0.accessibilityIdentifier == "31" })
        tile31?.sendActions(for: .touchUpInside)
        let text31 = tile31?.titleLabel?.text
        XCTAssertEqual(text31, "O")
        
        let tile13 = gameViewController.tileButtons.first(where: { $0.accessibilityIdentifier == "13" })
        tile13?.sendActions(for: .touchUpInside)
        let text13 = tile13?.titleLabel?.text
        XCTAssertEqual(text13, "X")
    }
    
    //MARK:- Tile Background tests
    
    func testWinTilesBackground() {
        
        let tile11 = gameViewController.tileButtons.first(where: { $0.accessibilityIdentifier == "11" })
        tile11?.sendActions(for: .touchUpInside)
        
        let tile21 = gameViewController.tileButtons.first(where: { $0.accessibilityIdentifier == "21" })
        tile21?.sendActions(for: .touchUpInside)
        
        let tile12 = gameViewController.tileButtons.first(where: { $0.accessibilityIdentifier == "12" })
        tile12?.sendActions(for: .touchUpInside)
        
        let tile31 = gameViewController.tileButtons.first(where: { $0.accessibilityIdentifier == "31" })
        tile31?.sendActions(for: .touchUpInside)
        
        let tile13 = gameViewController.tileButtons.first(where: { $0.accessibilityIdentifier == "13" })
        tile13?.sendActions(for: .touchUpInside)
        
        XCTAssertEqual(tile11?.backgroundColor, .green)
        XCTAssertEqual(tile12?.backgroundColor, .green)
        XCTAssertEqual(tile13?.backgroundColor, .green)
    }
    
    func testDrawTilesBackground() {
        let tile31 = gameViewController.tileButtons.first(where: { $0.accessibilityIdentifier == "31" })
        tile31?.sendActions(for: .touchUpInside)
        
        let tile21 = gameViewController.tileButtons.first(where: { $0.accessibilityIdentifier == "21" })
        tile21?.sendActions(for: .touchUpInside)
        
        let tile12 = gameViewController.tileButtons.first(where: { $0.accessibilityIdentifier == "12" })
        tile12?.sendActions(for: .touchUpInside)
        
        let tile11 = gameViewController.tileButtons.first(where: { $0.accessibilityIdentifier == "11" })
        tile11?.sendActions(for: .touchUpInside)
        
        let tile22 = gameViewController.tileButtons.first(where: { $0.accessibilityIdentifier == "22" })
        tile22?.sendActions(for: .touchUpInside)
        
        let tile32 = gameViewController.tileButtons.first(where: { $0.accessibilityIdentifier == "32" })
        tile32?.sendActions(for: .touchUpInside)
        
        let tile33 = gameViewController.tileButtons.first(where: { $0.accessibilityIdentifier == "33" })
        tile33?.sendActions(for: .touchUpInside)
        
        let tile13 = gameViewController.tileButtons.first(where: { $0.accessibilityIdentifier == "13" })
        tile13?.sendActions(for: .touchUpInside)
        
        let tile23 = gameViewController.tileButtons.first(where: { $0.accessibilityIdentifier == "23" })
        tile23?.sendActions(for: .touchUpInside)
        
        XCTAssertEqual(tile31?.backgroundColor, .yellow)
        XCTAssertEqual(tile21?.backgroundColor, .yellow)
        XCTAssertEqual(tile12?.backgroundColor, .yellow)
        XCTAssertEqual(tile11?.backgroundColor, .yellow)
        XCTAssertEqual(tile22?.backgroundColor, .yellow)
        XCTAssertEqual(tile32?.backgroundColor, .yellow)
        XCTAssertEqual(tile33?.backgroundColor, .yellow)
        XCTAssertEqual(tile13?.backgroundColor, .yellow)
        XCTAssertEqual(tile23?.backgroundColor, .yellow)
    }
    
    //MARK:- Reset tests
    
    func testReset() {
        
        let tile12 = gameViewController.tileButtons.first(where: { $0.accessibilityIdentifier == "12" })
        tile12?.sendActions(for: .touchUpInside)
        
        let tile11 = gameViewController.tileButtons.first(where: { $0.accessibilityIdentifier == "11" })
        tile11?.sendActions(for: .touchUpInside)
        
        let tile33 = gameViewController.tileButtons.first(where: { $0.accessibilityIdentifier == "33" })
        tile33?.sendActions(for: .touchUpInside)
        
        gameViewController.replayButtonTapped()
        
        
        let text = gameViewController.infoLabel.text
        XCTAssertEqual(text, "Player X's turn!")
        
        let tile12Reset = gameViewController.tileButtons.first(where: { $0.accessibilityIdentifier == "12" })?.titleLabel?.text
        XCTAssertEqual(tile12Reset, nil)
    }
}
