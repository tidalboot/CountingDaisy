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
    
    public init(){}
    
    public func correctAnswer() {
        score++
    }
    
    public func resetScore() {
        score = 0
    }
    
}