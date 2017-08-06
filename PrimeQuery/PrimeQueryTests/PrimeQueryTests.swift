//
//  PrimeQueryTests.swift
//  PrimeQueryTests
//
//  Created by Christopher Combes on 8/6/17.
//  Copyright © 2017 Christopher Combes. All rights reserved.
//

import XCTest
@testable import PrimeQuery

class PrimeQueryTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func loadTestData() -> [Int] {
        
        var data = [Int]()
        
        // Load resource file containing test data
        if let url = Bundle.main.url(forResource: "first_1000_primes", withExtension: "txt") {
            
            do {
                let contents = try String(contentsOf: url)
                let array = contents.components(separatedBy: CharacterSet.controlCharacters)
                
                // Filter empty strings
                let filtered_array = array.filter({ (item) -> Bool in
                    if item.lengthOfBytes(using: String.Encoding.utf8) > 0 {
                        return true
                    }
                    return false
                })
                
                // Convert array to Integers
                let mapped_array = filtered_array.map({ (item) -> Int in
                    let value = Int(item)
                    return value!
                })
                data = mapped_array
            } catch {
                print(error)
            }
        }
        
        return data
    }
    
    func test_isPrime() {
        // Source: https://www.di-mgt.com.au/primes1000.html
        // Verify the first 1000 primes based on known primes.
        let data = loadTestData()
        let primeTester = PrimeTester()
        for i in data {
            XCTAssert(primeTester.isPrime(number: i), "\(i) should be prime!")
        }
    }
    
    func test_primeNumberAt() {
        // Source: https://www.di-mgt.com.au/primes1000.html
        // Verify the first 1000 primes based on known primes.
        let data = loadTestData()
        let primeTester = PrimeTester()
        for i in 0..<data.count {
            let prime = primeTester.primeNumberAt(index: i)
            let checkPrime = data[i]
            // Prime number at each index should match
            XCTAssert(prime == checkPrime, "Prime numbers should match \(prime) != \(checkPrime) at index \(i)")
        }
    }
}
