//
//  RankTests.swift
//  Kazu
//
//  Created by Nick Jones on 08/06/2015.
//  Copyright (c) 2015 Nick Jones. All rights reserved.
//

import Foundation
import Kazu
import XCTest

class RankTests: XCTestCase {
    
    let rank = Rank(currentScore: 50)
    
    func test_rank_returns_the_current_rank () {
        XCTAssertEqual(rank.currentRank, 1, "Expected rank one but got \(rank.currentRank)")
    }
    
    func test_rank_returns_the_correct_amount_of_points_to_the_next_rank () {
        XCTAssertEqual(rank.pointsToNextRank, 30, "Expected 30 but got \(rank.pointsToNextRank)")
    }
}