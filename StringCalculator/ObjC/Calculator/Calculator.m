//
//  Calculator.m
//  Calculator
//
//  Created by Tony Hoang on 4/2/18.
//  Copyright © 2018 VisionPro. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

//
// Calculate product of numbers in the input string
//
- (NSInteger)multiply:(NSString*)input {
    if (input.length == 0) {
        return 0;
    }
    
    NSArray* numbers = [input componentsSeparatedByString:@","];
    
    switch (numbers.count) {
        case 0:
            return 0;

        case 1:
            return [numbers[0] integerValue];
        
        default:
            return [numbers[0] integerValue] *[numbers[1] integerValue];
    }
    
    return 0;
}

@end
