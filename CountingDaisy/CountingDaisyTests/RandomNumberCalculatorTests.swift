

import Foundation
import XCTest
import CountingDaisy

class randomNumberCalculatorTests: XCTestCase {
    
    var randomNumberCalculator: RandomNumberCalculator? = nil
    
    override func setUp() {
        super.setUp()
        randomNumberCalculator = RandomNumberCalculator()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    func test_that_generate_random_numbers_produces_2_acceptablly_random_numbers_between_1_and_100 () {
        var randomPairsToCheck: Int
        var numberOfMatchesFound = 0
        
        for randomPairsToCheck = 0; randomPairsToCheck < 10; randomPairsToCheck++ {
            var arrayOfRandomNumbers = randomNumberCalculator!.generateRandomNumbers(2,minumumValue: 1,maximumValue: 100)
            var firstNum = arrayOfRandomNumbers[0] as! Int
            var secondNum = arrayOfRandomNumbers[1] as! Int

            if  firstNum == secondNum {
                numberOfMatchesFound++
            }
            
            XCTAssertNotEqual(numberOfMatchesFound, 3, "Random tolerance too low as \(numberOfMatchesFound * 2) matches were found after \(randomPairsToCheck) random number requests")
        }
    }
    
    func test_that_generate_random_numbers_produces_numbers_within_the_specified_range () {
        
        var arrayOfRandomNumbers = randomNumberCalculator!.generateRandomNumbers(1,minumumValue: 10,maximumValue: 50)
        
        var numberInArray = arrayOfRandomNumbers[0] as! Int
        
        XCTAssertGreaterThanOrEqual(numberInArray, 10, "Number produced was less than the minimum specified")
        XCTAssertLessThanOrEqual(numberInArray, 50, "Number produced was greater than the maximum specified")
    }
    
    
    func test_that_generate_random_numbers_procudes_an_array_with_the_correct_number_of_objects_specifed () {
        
        var arrayOfRandomNumbers = randomNumberCalculator!.generateRandomNumbers(20,minumumValue: 1,maximumValue: 100)
        var numberOfObjectsInArray = arrayOfRandomNumbers.count
        
        XCTAssertEqual(numberOfObjectsInArray, 20, "generateRandomNumbers created an array of \(numberOfObjectsInArray) objects, expected 20")
        
    }
    
    
}

        