//
//  PrimeFactor.m
//  PrimeFactor
//
//  Created by Tony Hoang on 4/17/18.
//  Copyright © 2018 me. All rights reserved.
//

#import "PrimeFactor.h"

@implementation PrimeFactor

+ (NSArray*)generate:(NSInteger)num {
    if (num <= 1) {
        return nil;
    }
    
    NSMutableArray* primes;
    
    [primes addObject:@(num)];
    
    return [NSArray arrayWithArray:primes];
}

@end
