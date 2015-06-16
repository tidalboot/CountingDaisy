//
//  GameHandlerTests.swift
//  Kazu
//
//  Created by Nick Jones on 26/03/2015.
//  Copyright (c) 2015 Nick Jones. All rights reserved.
//

import Foundation
import XCTest
import Kazu

class GameHandlerTests: XCTestCase {
    
    var gameHandler: GameHandler? = nil
    
    override func setUp() {
        super.setUp()
        gameHandler = GameHandler()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_generate_result_returns_the_sum_of_the_values_passed_to_it_half_of_the_time() {
        
        var timesToTest: Int
        var numberOfExactResults = 0
        
        for timesToTest = 0; timesToTest < 100; timesToTest++ {
            let additionResult = gameHandler!.generateResult("+", augend: 1, addend: 2)
            
            if additionResult.answer == 3 {
                numberOfExactResults++
            }
            
            XCTAssertNotEqual(numberOfExactResults, 70, "Too many returned exact results")        }
    }
    
}