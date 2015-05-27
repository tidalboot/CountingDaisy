//
//  HighScoreHandler.swift
//  FoodForMort
//
//  Created by Nick Jones on 30/12/2014.
//  Copyright (c) 2014 Peinto. All rights reserved.
//

import Foundation
import SpriteKit

public class HighScoreHandler {
    
    var iCloudStore = NSUbiquitousKeyValueStore()
    var userDefaults = NSUserDefaults()
    
    public init () {}
    
    public func setHighScore(score:Int) {
        var latestScore = score
        var iCloudHighScore = Int(iCloudStore.doubleForKey("HighScore"))
        var localHighScore = userDefaults.integerForKey("Highscore")
        var scores = [latestScore, iCloudHighScore, localHighScore]
        
        updateUserDefaultHighScore(scores.reduce(0, combine: {max($0, $1)}))
        updateiCloudHighScore(Double(scores.reduce(0, combine: {max($0, $1)})))
    }
    
    public func retrieveHighScore() -> (Int) {
        var highScore = userDefaults.integerForKey("Highscore")
        return highScore
    }
    
    public func resetHighScore() {
        updateiCloudHighScore(0.0)
        updateUserDefaultHighScore(0)
    }
    
    func updateiCloudHighScore (newHighScore: Double) {
        iCloudStore.setDouble(Double(newHighScore), forKey: "HighScore")
        iCloudStore.synchronize()
    }
    
    func updateUserDefaultHighScore (newHighScore: Int) {
        userDefaults.setInteger(newHighScore, forKey: "Highscore")
    }
    
}