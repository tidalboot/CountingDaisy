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
    
//    var iCloudStore = NSUbiquitousKeyValueStore()
    var userDefaults = NSUserDefaults()
    
    public init(){}
    
    public func setHighScore(score:Int, highScoreToSet: String) {
        let latestScore = score
        let localHighScore = userDefaults.integerForKey("\(highScoreToSet)")
//        let iCloudHighScore = Int(iCloudStore.doubleForKey("\(highScoreToSet)"))
//        let scores = [latestScore, iCloudHighScore, localHighScore]
        let scores = [latestScore, localHighScore]

        
        updateUserDefaultHighScore(scores.reduce(0, combine: {max($0, $1)}), highScoreToSet: highScoreToSet)
//        updateiCloudHighScore(Double(scores.reduce(0, combine: {max($0, $1)})), highScoreToSet: highScoreToSet)
    }
    
    public func retrieveHighScore(highScoreToGet: String) -> (Int) {
        let localHighScore = userDefaults.integerForKey("\(highScoreToGet)")
//        let iCloudHighScore = Int(iCloudStore.doubleForKey("\(highScoreToGet)"))
//        return max(localHighScore, iCloudHighScore)
        return localHighScore
    }
    
    public func retrieveTotalScore () -> Int {
        var scores: Array<Int> = Array()
    
//        for score in iCloudStore.dictionaryRepresentation.keys {
//            scores.append(retrieveHighScore(score as! String))
//        }
        let highScoreHandler = HighScoreHandler()
        let additionScore = highScoreHandler.retrieveHighScore(GameMode.addition.rawValue)
        let subtractionScore = highScoreHandler.retrieveHighScore(GameMode.subtraction.rawValue)
        let divisionScore = highScoreHandler.retrieveHighScore(GameMode.division.rawValue)
        let multiplicationScore = highScoreHandler.retrieveHighScore(GameMode.multiplication.rawValue)
        
        let totalScore = additionScore + subtractionScore + divisionScore + multiplicationScore
        
        return totalScore
    }
    
    public func resetHighScore() {
//        for item in iCloudStore.dictionaryRepresentation.keys {
//                iCloudStore.removeObjectForKey(item as! String)
//        }
//        iCloudStore.synchronize()
        for item in userDefaults.dictionaryRepresentation().keys {
                userDefaults.removeObjectForKey(item as! String)
        }
    }
    
//    public func updateiCloudHighScore (newHighScore: Double, highScoreToSet: String) {
//        iCloudStore.setDouble(Double(newHighScore), forKey: "\(highScoreToSet)")
//        iCloudStore.synchronize()
//    }
//    
    public func updateUserDefaultHighScore (newHighScore: Int, highScoreToSet: String) {
        userDefaults.setInteger(newHighScore, forKey: "\(highScoreToSet)")
    }
    
}