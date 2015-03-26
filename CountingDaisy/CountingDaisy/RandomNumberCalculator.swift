//
//  RandomNumberCalculator.swift
//  CountingDaisy
//
//  Created by Nick Jones on 26/03/2015.
//  Copyright (c) 2015 Nick Jones. All rights reserved.
//

import Foundation

public class RandomNumberCalculator {
    
    public init () {
        
    }
    
    public func generateRandomNumbers (quantityOfNumbersToGenerate: Int, minumumValue: UInt32, maximumValue: UInt32) -> NSArray {
        var arrayToReturn: [Int] = []
        
        var i = 0
        
        while i < quantityOfNumbersToGenerate {
            var randomNumber = Int(arc4random_uniform(maximumValue) + minumumValue)
            arrayToReturn.append(randomNumber)
            i++
        }
        
        return arrayToReturn
    }
    
}