//
//  StringCalculatorTests.m
//  StringCalculatorTests
//
//  Created by Tony Hoang on 4/17/18.
//  Copyright © 2018 me. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Calculator.h"

@interface StringCalculatorTests : XCTestCase

@property (nonatomic, strong) Calculator* calculator;

@end

@implementation StringCalculatorTests

- (void)setUp {
    [super setUp];
    
    self.calculator = [Calculator new];
}

- (void)tearDown {
    [super tearDown];
    
    self.calculator = nil;
}

- (void)testEmptyOrNilOrInvalidStringShouldReturn0 {
    XCTAssertEqual([self.calculator add: nil], 0);
    XCTAssertEqual([self.calculator add:@""], 0);
    XCTAssertEqual([self.calculator add:@"two"], 0);
    XCTAssertEqual([self.calculator add:@"one, "], 0);
}

- (void)testSingleNumberShouldReturnItsValue {
    XCTAssertEqual([self.calculator add:@"1"], 1);
    XCTAssertEqual([self.calculator add:@"0"], 0);
    XCTAssertEqual([self.calculator add:@"2, "], 2);
}

- (void)testTwoNumbersShouldReturnTheSum {
    XCTAssertEqual([self.calculator add:@"1, 3"], 4);
    XCTAssertEqual([self.calculator add:@"1, 2, "], 3);
    XCTAssertEqual([self.calculator add:@"1, 2, ,"], 3);
    XCTAssertEqual([self.calculator add:@"1\n2"], 3);
}

- (void)testMoreThanTwoNumbersReturnTheSum {
    XCTAssertEqual([self.calculator add:@"1, 2, 3"], 6);
    XCTAssertEqual([self.calculator add:@"2, 1, 3, 4"], 10);
}

- (void)testExceptionThrownIfNegativeNumbers {
    XCTAssertThrows([self.calculator add:@"-3"]);
    XCTAssertThrows([self.calculator add:@"-1, -2"]);
}

- (void)testNumbersGreaterThan1000AreIgnored {
    XCTAssertEqual([self.calculator add:@"1001, 2"], 2);
}

- (void)testSingleHeadingDelimiter {
    XCTAssertEqual([self.calculator add:@"//;\n3;2"], 5);
    XCTAssertEqual([self.calculator add:@"//,\n3, 6"], 9);
}

- (void)testMultiCharacterDelimiter {
    XCTAssertEqual([self.calculator add:@"//[***]\n1***3"], 4);
    XCTAssertEqual([self.calculator add:@"//[**]\n3**5**2"], 10);
}

@end
