//
//  Frame.h
//  BowlingGame
//
//  Created by Tony Hoang on 4/16/18.
//  Copyright © 2018 me. All rights reserved.
//

#import <Foundation/Foundation.h>

extern const NSInteger MAX_SCORE_PER_FRAME;

@class Roll;
@interface Frame : NSObject

@property (nonatomic, readonly) NSInteger score;
@property (nonatomic, strong) NSMutableArray* rolls;
@property (nonatomic, readonly) BOOL isFinished;

- (instancetype)initWithRoll:(Roll*)roll;
- (void)addBonusFromRoll:(Roll*)roll;

@end
