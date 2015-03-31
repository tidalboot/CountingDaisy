
import Foundation

public class AdditionGameHandler {
    
    var randomNumberCalculator = RandomNumberCalculator()
    
    public init () {
        
    }
    
    public func generateResult (augend: Int, addend: Int) -> Int {
        
        var summationToReturn: Int
        var coinToss = Int(arc4random_uniform(10))
        
        if coinToss > 5 {
            var randomNumberToMinus = randomNumberCalculator.generateRandomNumber(1, maximumValue: 5)
            summationToReturn = (augend + addend) - randomNumberToMinus
        }else {
            summationToReturn = augend + addend
        }
        
        return summationToReturn
    }
    
}