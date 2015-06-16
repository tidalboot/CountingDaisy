
//  Rank.swift
//  Kazu
//
//  Created by Nick Jones on 08/06/2015.

import Foundation

public class Rank {
    private var score: Int!
    public init (Score: Int) {score = Score}
    
    public var currentRank: Int {get {return score / 40}}
    public var pointsToNextRank: Int {get {return ((currentRank + 1) * 40) - (score)}}
}



