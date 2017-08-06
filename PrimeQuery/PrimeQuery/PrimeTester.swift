//
//  PrimeTester.swift
//  PrimeQuery
//
//  Created by Christopher Combes on 8/6/17.
//  Copyright © 2017 Christopher Combes. All rights reserved.
//

import Foundation

// Source: https://en.wikipedia.org/wiki/Primality_test

class PrimeTester {
    var storedPrimes = [Int]()
    static let maxIndex = 1000
    
    func primeNumberAt(index: Int) -> Int {
        // Limit index for purpose of this exercise
        assert(index < PrimeTester.maxIndex, "Max index is \(PrimeTester.maxIndex)")
        
        // Check cache first
        if (storedPrimes.indices.contains(index)) {
            return storedPrimes[index]
        }
        
        // Calculate primes through requested index
        var currentPrime = 0
        if let value = storedPrimes.last {
            currentPrime = value
        }
        
        while storedPrimes.count <= index {
            if isPrime(number: currentPrime) {
                if !storedPrimes.contains(currentPrime) {
                    // Cache this prime for later retrieval
                    storedPrimes.append(currentPrime)
                }
            }
            currentPrime += 1
        }
        
        // At this point we have the prime at the specified index
        return storedPrimes[index]
    }
    
    func isPrime(number: Int) -> Bool {
        
        if number <= 1 {
            return false
        }
        else if number <= 3 {
            return true
        }
        else if number % 2 == 0 || number % 3 == 0 {
            return false
        }
        
        var iteration = 5
        while iteration * iteration <= number {
            if number % iteration == 0 || number % (iteration + 2) == 0 {
                return false
            }
            iteration += 6
        }
        
        return true
    }
    
}
