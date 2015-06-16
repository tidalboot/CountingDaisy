//
//  StatsTests.swift
//  Kazu
//
//  Created by Nick Jones on 16/06/2015.
//  Copyright (c) 2015 Nick Jones. All rights reserved.
//

import Foundation
import XCTest
import Kazu

class StatsTests: XCTestCase {
    
    var stats: Stats? = nil
    
    override func setUp() {
        super.setUp()
        stats = Stats()
    }
    
    override func tearDown() {super.tearDown()}
    
    func test_stats_correct_answer_adds_one_point_to_the_score () {
        stats!.score = 7
        stats!.correctAnswer()
        
        XCTAssertEqual(stats!.score, 8, "Expected the score to be 8 but instead got \(stats!.score)")
    }
    
    func test_stats_reset_sets_the_score_to_zero () {
        stats!.score = 10
        stats!.resetScore()
        
        XCTAssertEqual(stats!.score, 0, "Expected 0 but got \(stats!.score)")
    }
    
}