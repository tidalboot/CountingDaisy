//
//  RandomNumberCalculator.swift
//  Kazu
//
//  Created by Nick Jones on 26/03/2015.
//  Copyright (c) 2015 Nick Jones. All rights reserved.
//

import Foundation

class RandomNumberCalculator {
        
    func generateRandomNumber (minumumValue: Int32, maximumValue: Int32) -> Int {
        
        if maximumValue < minumumValue {return 0}
        
        if (maximumValue < 0 && minumumValue < 0) {
            let minimumValueAsPositive = UInt32(minumumValue - (minumumValue * 2))
            let maximumValueAsPositive = UInt32(maximumValue - (maximumValue * 2))
            let randomNumber = Int(arc4random_uniform(minimumValueAsPositive - maximumValueAsPositive) + maximumValueAsPositive)
            return randomNumber - (randomNumber * 2)
        }
        
        return Int(arc4random_uniform(UInt32(maximumValue - minumumValue))) + Int(minumumValue)
    }
    
    func generateRandomNumbers (quantityOfNumbersToGenerate: Int, minumumValue: Int32, maximumValue: Int32) -> NSArray {
        var arrayToReturn: [Int] = []
        var i = 0
        
        while i < quantityOfNumbersToGenerate {
            let randomNumber = generateRandomNumber(minumumValue, maximumValue: maximumValue)
            arrayToReturn.append(randomNumber)
            i++
        }
        
        let newArrayToReturn = sorted(arrayToReturn, >)
        return newArrayToReturn
    }

}