
//  Rank.swift
//  Kazu
//
//  Created by Nick Jones on 08/06/2015.

import Foundation

class Rank {
    private var score: Int!
    init (Score: Int) {score = Score}
    
    var currentRank: Int {get {return score / 40}}
    var pointsToNextRank: Int {get {return ((currentRank + 1) * 40) - (score)}}
}



