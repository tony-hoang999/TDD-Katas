//
//  PrimeFactors.swift
//  PrimeFactors
//
//  Created by Tony Hoang on 4/17/18.
//  Copyright © 2018 me. All rights reserved.
//

class PrimeFactors {
    static func generate(num: Int) -> [Int] {
        if num <= 1 {
            return []
        }
        
        var primes = [Int]()
        var number = num

        var divisor = 2
        
        while number > 1 {
            while number%divisor == 0 {
                number = number/divisor
                primes.append(divisor)
            }
            
            divisor += 1
        }
        
        return primes
    }
}
