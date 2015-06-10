//
//  HighScoreHandler.swift
//  FoodForMort
//
//  Created by Nick Jones on 30/12/2014.
//  Copyright (c) 2014 Peinto. All rights reserved.
//

import Foundation
import SpriteKit

class HighScoreHandler {
    
    var iCloudStore = NSUbiquitousKeyValueStore()
    var userDefaults = NSUserDefaults()
    
    
    func setHighScore(score:Int, highScoreToSet: String) {
        let latestScore = score
        let localHighScore = userDefaults.integerForKey("\(highScoreToSet)")
        let iCloudHighScore = Int(iCloudStore.doubleForKey("\(highScoreToSet)"))
        let scores = [latestScore, iCloudHighScore, localHighScore]
//        let scores = [latestScore, localHighScore]

        
        updateUserDefaultHighScore(scores.reduce(0, combine: {max($0, $1)}), highScoreToSet: highScoreToSet)
        updateiCloudHighScore(Double(scores.reduce(0, combine: {max($0, $1)})), highScoreToSet: highScoreToSet)
    }
    
    func retrieveHighScore(highScoreToGet: String) -> (Int) {
        let localHighScore = userDefaults.integerForKey("\(highScoreToGet)")
        let iCloudHighScore = Int(iCloudStore.doubleForKey("\(highScoreToGet)"))
        return max(localHighScore, iCloudHighScore)
    }
    
    func retrieveHighScores () -> Array<Int> {
        var arrayToReturn: Array<Int> = Array()
        for score in iCloudStore.dictionaryRepresentation.keys {
            arrayToReturn.append(retrieveHighScore(score as! String))
        }
        return arrayToReturn
    }
    
    func resetHighScore() {
        for item in iCloudStore.dictionaryRepresentation.keys {
                iCloudStore.removeObjectForKey(item as! String)
        }
        iCloudStore.synchronize()
        for item in userDefaults.dictionaryRepresentation().keys {
                userDefaults.removeObjectForKey(item as! String)
        }
    }
    
    func updateiCloudHighScore (newHighScore: Double, highScoreToSet: String) {
        iCloudStore.setDouble(Double(newHighScore), forKey: "\(highScoreToSet)")
        iCloudStore.synchronize()
    }
    
    func updateUserDefaultHighScore (newHighScore: Int, highScoreToSet: String) {
        userDefaults.setInteger(newHighScore, forKey: "\(highScoreToSet)")
    }
    
}