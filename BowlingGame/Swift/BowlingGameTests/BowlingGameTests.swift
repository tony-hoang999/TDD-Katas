//
//  BowlingGameTests.swift
//  BowlingGameTests
//
//  Created by Tony Hoang on 4/16/18.
//  Copyright © 2018 me. All rights reserved.
//

import XCTest
@testable import BowlingGame

extension Game {
    func makeFrames(firstRoll: Int, secondRoll: Int, times: Int) {
        for _ in 0..<times {
            self.roll(with: firstRoll)
            self.roll(with: secondRoll)
        }
    }
    
    func makeStrikes(times: Int) {
        for _ in 0..<times {
            self.roll(with: Game.maxScorePerFrame)
        }
    }
    
    func print() {
        for frame in frames {
            Swift.print(frame)
        }
    }
}

class BowlingGameTests: XCTestCase {
    
    var game: Game!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        game = Game()
    }
    
    override func tearDown() {
        game = nil

        super.tearDown()
    }
    
    func testAllGutterBallsShouldScore0() {
        // 1st frame
        game.roll(with: 0)
        game.roll(with: 0)
        XCTAssertEqual(game.score, 0)
        
        game.makeFrames(firstRoll: 0, secondRoll: 0, times: 9)
        XCTAssertEqual(game.score, 0)
    }
    
    func testPerfectGameShouldScore300() {
        // 10 strike
        game.makeStrikes(times: 10)
        XCTAssertEqual(game.frames.count, 10)
        
        // Bonus strikes
        game.makeStrikes(times: 2)
//        game.print()
        XCTAssertEqual(game.score, 300)
    }
    
    func testStrikes() {
        // 1st frame is a strike
        game.makeStrikes(times: 1)
        XCTAssertEqual(game.frames.count, 1)
//        game.print()
        XCTAssertEqual(game.score, 10)
        
        // 2nd strike
        game.makeStrikes(times: 1)
        XCTAssertEqual(game.frames.count, 2)
        XCTAssertEqual(game.score, 30)
        
        game.makeStrikes(times: 8)
        XCTAssertEqual(game.frames.count, 10)
        XCTAssertEqual(game.score, 270)
    }
    
    func testSpares() {
        // 1st spare
        game.makeFrames(firstRoll: 2, secondRoll: 8, times: 1)
        XCTAssertEqual(game.frames.count, 1)
        XCTAssertEqual(game.score, 10)
        
        // 2nd spare
        game.makeFrames(firstRoll: 2, secondRoll: 8, times: 1)
        game.print()
        XCTAssertEqual(game.frames.count, 2)
        XCTAssertEqual(game.score, 22)
        
        game.makeFrames(firstRoll: 2, secondRoll: 2, times: 8)
        XCTAssertEqual(game.score, 56)
    }
    
    func testCombination() {
        game.makeFrames(firstRoll: 3, secondRoll: 1, times: 1)
        XCTAssertEqual(game.frames.count, 1)
        XCTAssertEqual(game.score, 4)
        
        // Make a strike
        game.makeStrikes(times: 1)
        XCTAssertEqual(game.frames.count, 2)
        XCTAssertEqual(game.score, 14)
        
        // Make a spare
        game.makeFrames(firstRoll: 8, secondRoll: 2, times: 1)
        XCTAssertEqual(game.frames.count, 3)
        XCTAssertEqual(game.score, 34)
        
        game.makeFrames(firstRoll: 7, secondRoll: 2, times: 1)
        XCTAssertEqual(game.frames.count, 4)
        XCTAssertEqual(game.score, 50)
        
        game.makeFrames(firstRoll: 4, secondRoll: 5, times: 6)
        XCTAssertEqual(game.frames.count, 10)
        XCTAssertEqual(game.score, 104)
    }
    
    func testCombination2() {
        game.makeFrames(firstRoll: 2, secondRoll: 8, times: 2)
        game.makeFrames(firstRoll: 2, secondRoll: 2, times: 9)
        
        XCTAssertEqual(game.score, 56)
    }
    
    func testIncidentallyAddNewRollAfterGameFinished() {
        game.makeFrames(firstRoll: 2, secondRoll: 2, times: 10)
        XCTAssertEqual(game.frames.count, 10)
        XCTAssertEqual(game.score, 40)
        
        game.roll(with: 4)
        XCTAssertEqual(game.frames.count, 10)
        XCTAssertEqual(game.score, 40)
        
        game.makeFrames(firstRoll: 3, secondRoll: 5, times: 2)
        XCTAssertEqual(game.frames.count, 10)
        XCTAssertEqual(game.score, 40)
    }
}
