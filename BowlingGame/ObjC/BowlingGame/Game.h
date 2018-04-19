//
//  Game.h
//  BowlingGame
//
//  Created by Tony Hoang on 4/16/18.
//  Copyright © 2018 me. All rights reserved.
//

#import <Foundation/Foundation.h>

extern const NSInteger NUM_OF_BONUS_ROLLS_PER_STRIKE;
extern const NSInteger NUM_OF_BONUS_ROLLS_PER_SPARE;
extern const NSInteger NUM_OF_FRAME_PER_GAME;

@interface Game : NSObject

@property (nonatomic, readonly) NSInteger score;

- (void)rollWithScore:(NSInteger)score;

@end
