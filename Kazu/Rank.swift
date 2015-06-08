
//  Rank.swift
//  Kazu
//
//  Created by Nick Jones on 08/06/2015.

import Foundation

public class Rank {
    
    public var score: Int!
    
    public init (currentScore: Int) {score = currentScore}
    
    public var currentRank: Int {
        get {return score / 40}
        set {}
    }
    
    public var pointsToNextRank: Int {
        get {return ((currentRank + 1) * 40) - (score)}
        set {}
    }
}