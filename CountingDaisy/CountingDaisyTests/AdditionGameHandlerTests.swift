//
//  AdditionGameHandlerTests.swift
//  CountingDaisy
//
//  Created by Nick Jones on 26/03/2015.
//  Copyright (c) 2015 Nick Jones. All rights reserved.
//

import Foundation
import XCTest
import CountingDaisy

class AdditionGameHandlerTests: XCTestCase {
    
    var additionGameHandlerTests: AdditionGameHandler? = nil
    
    override func setUp() {
        super.setUp()
        additionGameHandlerTests = AdditionGameHandler()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_generate_result_returns_the_sum_of_the_values_passed_to_it_half_of_the_time() {
        
        var timesToTest: Int
        var numberOfExactResults = 0
        
        
        for timesToTest = 0; timesToTest < 10; timesToTest++ {
            var additionResult = additionGameHandler.generateResult(1, 2)
            
            if additionResult == 3 {
                numberOfExactResults++
            }
            
            XCTAssertNotEqual(numberOfExactResults, 7, "Random tolerance is too low. \(numberOfExactResults) numbers were returned as correct which is above the 50% allowed")
        }
    }
    
}