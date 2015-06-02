//
//  HighScoreHandlerTests.swift
//  Kazu
//
//  Created by Nick Jones on 01/06/2015.
//  Copyright (c) 2015 Nick Jones. All rights reserved.
//

import Foundation
import XCTest
import Kazu

class HighScoreHandlerTests: XCTestCase {
    
    var highScoreHandler: HighScoreHandler? = nil
    
    override func setUp() {
        super.setUp()
        highScoreHandler = HighScoreHandler()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_set_highscore_updates_the_highscore_if_new_score_is_higher_than_stored_highscore() {
        highScoreHandler?.setHighScore(10, highScoreToSet: "+")
        highScoreHandler?.setHighScore(20, highScoreToSet: "+")
        var highestScore = highScoreHandler?.retrieveHighScore("+")
        
        XCTAssert(highestScore == 20, "Expected 20 but got \(highestScore)")
    }
    
    func test_set_highscore_does_not_update_the_highscore_if_new_score_is_lower_than_stored_highscore () {
        highScoreHandler?.setHighScore(20, highScoreToSet: "+")
        highScoreHandler?.setHighScore(10, highScoreToSet: "+")
        var highestScore = highScoreHandler?.retrieveHighScore("+")
        
        XCTAssert(highestScore == 20, "Expected 30 but got \(highestScore)")
    }
    
    func test_reset_highscore_resets_the_highscore () {
        highScoreHandler?.setHighScore(100, highScoreToSet: "+")
        highScoreHandler?.resetHighScore()
        var highestScore = highScoreHandler?.retrieveHighScore("+")
        
        XCTAssert(highestScore == 0, "Expected 0 but got \(highestScore)")
    }
    
}
