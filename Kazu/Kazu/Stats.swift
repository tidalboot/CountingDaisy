//
//  Stats.swift
//  Kazu
//
//  Created by Nick Jones on 16/06/2015.
//  Copyright (c) 2015 Nick Jones. All rights reserved.
//

import Foundation

public class Stats{
    
    public var score = 0
    public var highScoreDifference = 0
    public var wrongAnswers = 0
    public var highestStreak = 0
    public var currentStreak = 0
    public var gameMode: GameMode!
    
    public init(){}
    
    public func correctAnswer() {
        score++
        currentStreak++
        highestStreak = max(highestStreak, currentStreak)
    }
    
    public func incorrectAnswer() {
        wrongAnswers++
        currentStreak = 0
    }
    
    public func reset() {
        score = 0
        wrongAnswers = 0
        highestStreak = 0
        currentStreak = 0
    }
    
    public func calculateHighScoreDifference () -> Int {
        let highScore = HighScoreHandler().retrieveHighScore(gameMode.rawValue)
        return score - highScore
    }
    
}