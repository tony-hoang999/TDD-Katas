//
//  PrimeFactorsTests.swift
//  PrimeFactorsTests
//
//  Created by Tony Hoang on 4/17/18.
//  Copyright © 2018 me. All rights reserved.
//

import XCTest
@testable import PrimeFactors

class PrimeFactorsTests: XCTestCase {
    
    func testOne() {
        XCTAssertEqual(PrimeFactors.generate(num: 1), [])
    }
    
    func testTwo() {
        XCTAssertEqual(PrimeFactors.generate(num: 2), [2])
    }
    
    func testThree() {
        XCTAssertEqual(PrimeFactors.generate(num: 3), [3])
    }
    
    func testFour() {
        XCTAssertEqual(PrimeFactors.generate(num: 4), [2, 2])
    }
    
    func testSix() {
        XCTAssertEqual(PrimeFactors.generate(num: 6), [2, 3])
    }
    
    func testEight() {
        XCTAssertEqual(PrimeFactors.generate(num: 8), [2, 2, 2])
    }
    
    func testNine() {
        XCTAssertEqual(PrimeFactors.generate(num: 9), [3, 3])
    }
}
