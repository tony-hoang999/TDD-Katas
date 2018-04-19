//
//  BowlingGameTests.m
//  BowlingGameTests
//
//  Created by Tony Hoang on 4/16/18.
//  Copyright © 2018 me. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Game.h"
#import "Frame.h"

@interface BowlingGameTests : XCTestCase

@end

@implementation BowlingGameTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)makeStrike:(Game*)game repeat:(NSInteger)repeat {
    for (int i = 0; i < repeat; i ++) {
        [game rollWithScore:MAX_SCORE_PER_FRAME];
    }
}

- (void)makeFrames:(Game*)game firstRoll:(NSInteger)firstRoll secondRoll:(NSInteger)secondRoll repeat:(NSInteger)repeat {
    for (int i = 0; i < repeat; i ++) {
        [game rollWithScore:firstRoll];
        [game rollWithScore:secondRoll];
    }
}

// All gutter balls should score 0
- (void)testAllGutterBallsShouldScore0 {
    Game* game = [Game new];
    
    [game rollWithScore:0];
    [game rollWithScore:0];
    XCTAssertEqual(game.score, 0);
    
    [self makeFrames:game firstRoll:0 secondRoll: 0 repeat:9];
    XCTAssertEqual(game.score, 0, "All gutter balls should score 0");
}

- (void)testPerfectGameShouldScore300 {
    Game* game = [Game new];

    // 1st frame
    [game rollWithScore:10];
    XCTAssertEqual(game.score, 10);

    // 2nd frame
    [game rollWithScore:10];
    XCTAssertEqual(game.score, 30, "2 strikes should score 30");
 
    // 3rd frame
    [game rollWithScore:10];
    XCTAssertEqual(game.score, 60, "3 strikes should score 60");
    
    // Next 7 frame
    [self makeStrike:game repeat:7];
    
    // Two bonus balls
    [game rollWithScore:10];
    [game rollWithScore:10];
    XCTAssertEqual(game.score, 300, "Perfect game should score 300");
}

- (void)testSpare {
    Game* game = [Game new];
    
    // First frame
    [game rollWithScore:2];
    [game rollWithScore:8];
    XCTAssertEqual(game.score, 10);
    
    // Next 9 frames
    [self makeFrames:game firstRoll: 2 secondRoll:2 repeat:9];
    XCTAssertEqual(game.score, 48, "Final score should be 48");
}

- (void)testCombination {
    Game* game = [Game new];
    
    // 1st frame is a strike
    [game rollWithScore:10];
    XCTAssertEqual(game.score, 10);
    
    // 2nd frame is a spare
    [self makeFrames:game firstRoll:2 secondRoll:8 repeat:1];
    XCTAssertEqual(game.score, 30);
    
    [self makeFrames:game firstRoll:3 secondRoll:6 repeat:1];
    XCTAssertEqual(game.score, 42);
}

- (void)testRegularCases {
    Game* game = [Game new];
    
    [game rollWithScore:4];
    XCTAssertEqual(game.score, 4);
    
    [game rollWithScore:5];
    XCTAssertEqual(game.score, 9);
    
    [game rollWithScore:7];
    XCTAssertEqual(game.score, 16);
}

@end
