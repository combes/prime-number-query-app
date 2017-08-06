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
    
    /// Maximum prime index allowed
    static let maxIndex = 4000
    
    // TODO: The calculation for higher primes will take considerable processing time.
    // Max index in excess of 4000 will take more than a second.
    // Therefore, this calculation should occur on a background thread with a progress indicator in the UI.
    
    /// Get the prime number at the specified index.
    ///
    /// - Parameter index: Index from 0 to maxIndex
    /// - Returns: Corresponding prime number
    func primeNumberAt(index: Int) -> Int {
        // Limit index for purpose of this exercise
        assert(index <= PrimeTester.maxIndex, "Max index is \(PrimeTester.maxIndex)")
        
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
    
    
    /// Determines if a number is prime or not.
    ///
    /// - Parameter number: Number to consider as prime
    /// - Returns: true if number is prime, false if not
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
