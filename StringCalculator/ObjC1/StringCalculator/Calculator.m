//
//  Calculator.m
//  StringCalculator
//
//  Created by Tony Hoang on 4/17/18.
//  Copyright © 2018 me. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

- (NSInteger)add:(NSString *)input {
    NSArray* numbers = nil;
    
    NSRange range = [input rangeOfString:@"//"];
    if (range.location != NSNotFound) {
        NSArray* lines = [input componentsSeparatedByCharactersInSet:NSCharacterSet.newlineCharacterSet];
        
        if (lines.count > 0) {
            NSString* delimiter = [lines[0] substringFromIndex:range.location+range.length];
            
            if ([delimiter hasPrefix:@"["]) {
                range = [delimiter rangeOfString:@"["];
                delimiter = [delimiter substringFromIndex:range.location+range.length];
                delimiter = [delimiter substringToIndex:delimiter.length-1];
            }
            
            if (lines.count > 1) {
                numbers = [lines[1] componentsSeparatedByString:delimiter];
            }
        }
    } else {
        NSCharacterSet* charSet = [NSCharacterSet characterSetWithCharactersInString:@",\n"];
        numbers = [input componentsSeparatedByCharactersInSet:charSet];
    }
    
    NSInteger sum = 0;
    for (NSString* number in numbers) {
        NSInteger value = number.integerValue;
        
        if (value < 0) {
            @throw([NSException exceptionWithName:@"Negative" reason:@"negatives not allowed" userInfo:nil]);
        } else if (value >= 0 && value <= 1000) {
            sum += number.integerValue;
        }
    }
    
    return sum;
}

@end
