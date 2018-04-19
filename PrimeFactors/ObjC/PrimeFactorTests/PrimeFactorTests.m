//
//  PrimeFactorTests.m
//  PrimeFactorTests
//
//  Created by Tony Hoang on 4/17/18.
//  Copyright © 2018 me. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PrimeFactor.h"

@interface PrimeFactorTests : XCTestCase

@end

@implementation PrimeFactorTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testOne {
    XCTAssertEqual([PrimeFactor generate: 1], nil);
}

- (void)testTwo {
    NSArray* primes = [PrimeFactor generate:2];
    XCTAssertEqual(primes, ([NSArray arrayWithObjects:@(2), nil]));
}

- (void)testThree {
    XCTAssertEqualObjects([PrimeFactor generate:3], @[@3]);
}

- (void)testFour {
    XCTAssertEqualObjects([PrimeFactor generate:4], (@[@2, @2]));
}

@end
