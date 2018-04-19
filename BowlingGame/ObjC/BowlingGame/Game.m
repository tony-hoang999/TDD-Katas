//
//  Game.m
//  BowlingGame
//
//  Created by Tony Hoang on 4/16/18.
//  Copyright © 2018 me. All rights reserved.
//

#import "Game.h"
#import "Frame.h"
#import "Roll.h"

@interface Game()

@property (nonatomic, strong) NSMutableArray* frames;
@property (nonatomic, strong) NSMutableArray* bonusRolls;

@end

const NSInteger NUM_OF_BONUS_ROLLS_PER_STRIKE = 2;
const NSInteger NUM_OF_BONUS_ROLLS_PER_SPARE = 1;
const NSInteger NUM_OF_FRAME_PER_GAME = 10;

@implementation Game

- (id)init {
    if (self = [super init]) {
        self.frames = [NSMutableArray new];
        self.bonusRolls = [NSMutableArray new];
    }
    
    return self;
}

- (NSInteger)score {
    NSInteger _score = 0;
    
    for (Frame* frame in self.frames) {
        NSLog(@"score = %@", [frame description]);
        _score += frame.score;
    }
    
    return _score;
}

- (void)handleBonusForRoll:(Roll*)roll {
    [self.bonusRolls addObject:roll];
    
    for (int i = 1; i <= NUM_OF_BONUS_ROLLS_PER_STRIKE; i ++) {
        Frame* frameToUpdate = [self.frames objectAtIndex:NUM_OF_FRAME_PER_GAME-i];
        [frameToUpdate addBonusFromRoll:roll];
    }
}

- (void)handleRegularRoll:(Roll*)roll {
    Frame* lastFrame = [self.frames lastObject];
    
    // Create a new frame if last frame is full or not initialized, or has reached the max score per frame
    if (lastFrame == nil || lastFrame.isFinished) {
        Frame* newFrame = [[Frame alloc] initWithRoll:roll];
        [self.frames addObject: newFrame];
        lastFrame = [self.frames lastObject];
    } else {
        [lastFrame.rolls addObject:roll];
    }
    
    // Update score for the two rolls
    NSInteger lastFrameIdx = [self.frames indexOfObject: lastFrame];
    
    int count = 0;
    int i = 1;
    while (lastFrameIdx-i >= 0 && count < NUM_OF_BONUS_ROLLS_PER_STRIKE) {
        Frame* prevFrame = [self.frames objectAtIndex:lastFrameIdx-i];
        [prevFrame addBonusFromRoll:roll];
        
        i ++;
        count += prevFrame.rolls.count;
    }
}

- (void)rollWithScore:(NSInteger)score {
    Roll* roll = [[Roll alloc] initWithScore:score];
    Frame* lastFrame = [self.frames lastObject];
    
    // This is a bonus roll
    if (self.frames.count == NUM_OF_FRAME_PER_GAME && lastFrame.isFinished) {
        [self handleBonusForRoll:roll];
    }
    // This is a regular roll
    else {
        [self handleRegularRoll:roll];
    }
}

@end
