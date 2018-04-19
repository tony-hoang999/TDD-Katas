//
//  CalculatorTests.m
//  CalculatorTests
//
//  Created by Tony Hoang on 4/2/18.
//  Copyright © 2018 VisionPro. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Calculator.h"

@import Nimble;
@import Quick;

@interface CalculatorTests : QuickSpec

@end

static Calculator* calculator;

@implementation CalculatorTests

+ (void)setUp {
    [super setUp];
    
    calculator = [Calculator new];
}

- (void)spec {
    [super spec];
    
    describe(@"Calculator Test", ^{
        // Input array contains 2 numbers
        context(@"Input array contains 2 numbers", ^{
            it(@"Returns the product of the two numbers", ^{
                NSInteger product = [calculator multiply:@"1, 3"];
                expect(product).to(equal(3));
            });
        });
        
        // Input array contains only 1 number
        context(@"Input Array contains only 1 number", ^{
            it(@"Returns the number", ^{
                NSInteger product = [calculator multiply:@"1"];
                expect(product).to(equal(1));
            });
        });

        // Input array contains more than 2 numbers
        context(@"Input array contains more than 2 numbers", ^{
            it(@"Returns the sum of the 2 first numbers", ^{
                NSInteger product = [calculator multiply:@"1, 2, 3, 4"];
                expect(product).to(equal(2));
            });
        });
        
        // Input array contains an invalid number
        context(@"Input array contains an invalid number", ^{
            it(@"Returns 0", ^{
                NSInteger product = [calculator multiply:@"1, a2, 3, 4"];
                expect(product).to(equal(0));
            });
        });
        
        // Input array is nil
        context(@"Input array is nil", ^{
            it(@"Return 0", ^{
                NSInteger product = [calculator multiply:nil];
                expect(product).to(equal(0));
            });
        });
        
        // Input array is empty
        context(@"Input array is Empty", ^{
            it(@"Returns 0", ^{
                NSInteger product = [calculator multiply: @""];
                expect(product).to(equal(0));
            });
        });
    });
}

@end
