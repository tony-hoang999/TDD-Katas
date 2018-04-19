//
//  Frame.m
//  BowlingGame
//
//  Created by Tony Hoang on 4/16/18.
//  Copyright © 2018 me. All rights reserved.
//

#import "Frame.h"
#import "Roll.h"
#import "Game.h"

@interface Frame()

@property (nonatomic, strong) NSMutableArray* rewards;
@property (nonatomic, assign, readonly) NSInteger baseScore;

@property (nonatomic, assign, readonly) BOOL isStrike;
@property (nonatomic, assign, readonly) BOOL isSpare;

@end

const NSInteger MAX_SCORE_PER_FRAME = 10;
const NSInteger MAX_ROLLS_PER_FRAME = 2;

@implementation Frame

- (instancetype)initWithRoll:(Roll*)roll {
    if (self = [super init]) {
        _rolls = [NSMutableArray new];
        _rewards = [NSMutableArray new];
        
        [_rolls addObject:roll];
    }
    
    return self;
}

- (NSInteger)score {
    NSInteger score = 0;
    
    score += self.baseScore;
    
    for (NSNumber* reward in self.rewards) {
        score += reward.integerValue;
    }
    
    return score;
}

- (NSInteger)baseScore {
    NSInteger score = 0;
    
    for (Roll* roll in self.rolls) {
        score += roll.score;
    }

    return score;
}

- (BOOL)isStrike {
    Roll* firstRoll = self.rolls.firstObject;
    return firstRoll.score == MAX_SCORE_PER_FRAME;
}

- (BOOL)isSpare {
    return ![self isStrike] && (self.baseScore == MAX_SCORE_PER_FRAME);
}

- (BOOL)isFinished {
    return self.isStrike || self.rolls.count == MAX_ROLLS_PER_FRAME;
}

- (void)addBonusFromRoll:(Roll*)roll {
    if (self.isStrike) {
        if (self.rewards.count < NUM_OF_BONUS_ROLLS_PER_STRIKE) {
            [self.rewards addObject:@(roll.score)];
        }
    } else if (self.isSpare) {
        if (self.rewards.count < NUM_OF_BONUS_ROLLS_PER_SPARE) {
            [self.rewards addObject:@(roll.score)];
        }
    }
}

- (NSString*)description {
    NSString* desc = @"(rolls: (";
    
    for (Roll* roll in self.rolls) {
        desc = [desc stringByAppendingFormat:@"%ld, ", roll.score];
    }
    
    desc = [desc stringByAppendingString:@"), bonuses: ("];
    
    for (NSNumber* reward in self.rewards) {
        desc = [desc stringByAppendingFormat:@"%ld, ", reward.integerValue];
    }
    
    desc = [desc stringByAppendingString:@"))"];
    
    return desc;
}

@end
