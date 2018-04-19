//
//  Roll.h
//  BowlingGame
//
//  Created by Tony Hoang on 4/16/18.
//  Copyright © 2018 me. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Roll : NSObject

@property (nonatomic, readonly) NSInteger score;

- (instancetype) initWithScore:(NSInteger)score;

@end
