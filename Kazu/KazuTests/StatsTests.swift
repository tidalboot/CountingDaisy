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
    
    //Score tests
    func test_stats_correct_answer_increments_score_by_one () {
        stats!.score = 7
        stats!.correctAnswer()
        XCTAssertEqual(stats!.score, 8, "Expected the score to be 8 but instead got \(stats!.score)")
    }
    
    func test_stats_incorrect_answer_does_not_increment_score_by_one  () {
        stats!.score = 8
        stats!.incorrectAnswer()
        XCTAssertEqual(stats!.score, 8, "Expected 8 but got \(stats!.score)")
    }
    
    func test_stats_reset_sets_the_score_to_zero () {
        stats!.score = 10
        stats!.reset()
        XCTAssertEqual(stats!.score, 0, "Expected 0 but got \(stats!.score)")
    }
    //---------------------

    
    
    //Wrong answer tests
    func test_stats_incorrect_answer_increments_wrong_answers_by_one () {
        stats!.incorrectAnswer()
        XCTAssertEqual(stats!.wrongAnswers, 1, "Expected 1 but got \(stats!.wrongAnswers)")
    }
    
    func test_stats_correct_answers_does_not_increment_wrong_answer_by_one () {
        stats!.correctAnswer()
        XCTAssertEqual(stats!.wrongAnswers, 0, "Expected 0 but got \(stats!.wrongAnswers)")
    }
    
    func test_stats_reset_sets_wrong_answers_to_zero () {
        stats!.wrongAnswers = 10
        stats!.reset()
        XCTAssertEqual(stats!.wrongAnswers, 0, "Expected 0 but got \(stats!.wrongAnswers)")
    }
    //---------------------
    
    
    //Longest Streak tests
    func test_correct_answer_increments_current_streak_by_one () {
        stats!.currentStreak = 5
        stats!.correctAnswer()
        XCTAssertEqual(stats!.currentStreak, 6, "Expected 6 but got \(stats!.currentStreak)")
    }
    func test_correct_answer_updates_highest_streak_when_current_streak_is_greater () {
        stats!.highestStreak = 8
        stats!.currentStreak = 8
        stats!.correctAnswer()
        XCTAssertEqual(stats!.highestStreak, 9, "Expected 9 but got \(stats!.highestStreak)")
    }
    func test_incorrect_answer_sets_current_streak_to_zero () {
        stats!.currentStreak = 8
        stats!.incorrectAnswer()
        XCTAssertEqual(stats!.currentStreak, 0, "Expected 0 but got \(stats!.currentStreak)")
    }
    func test_stats_reset_sets_current_streak_to_zero () {
        stats!.currentStreak = 8
        stats!.reset()
        XCTAssertEqual(stats!.currentStreak, 0, "Expected 0 but got \(stats!.currentStreak)")
    }
    func test_stats_reset_sets_highest_streak_to_zero () {
        stats!.highestStreak = 8
        stats!.reset()
        XCTAssertEqual(stats!.highestStreak, 0, "Expected 0 but got \(stats!.highestStreak)")
    }
    //---------------------

    
    
    //High score difference tests
//    
//    func test_calculate_high_score_difference_correctly_returns_the_score_difference () {
////        var highScore = HighScoreHandler().retrieveHighScore("+")
//        var difference = stats!.calculateHighScore("+",)
//    }
    
    
    //---------------------

}















