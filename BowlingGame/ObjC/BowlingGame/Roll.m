//
//  Roll.m
//  BowlingGame
//
//  Created by Tony Hoang on 4/16/18.
//  Copyright © 2018 me. All rights reserved.
//

#import "Roll.h"

@implementation Roll

- (instancetype)initWithScore:(NSInteger)score {
    if (self = [super init]) {
        _score = score;
    }
    
    return self;
}

@end
