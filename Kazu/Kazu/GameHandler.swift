
import Foundation

public class GameHandler {
    
    var randomNumberCalculator = RandomNumberCalculator()
    
    public init () {}
    
    public func generateResult (operatorToUse: String, augend: Int, addend: Int) -> (answer: Int, answerIsCorrect: Bool) {
        
        var answerToReturn: Int = 0
        var isAnswerCorrect: Bool
        var coinToss = Int(arc4random_uniform(10))
        
        if coinToss > 5 {
            var randomNumberToMinus = randomNumberCalculator.generateRandomNumber(-10, maximumValue: 10)
            switch operatorToUse {
            case "+": answerToReturn = (augend + addend) + randomNumberToMinus
            case "−": answerToReturn = (augend - addend) + randomNumberToMinus
            case "×": answerToReturn = (augend * addend) + randomNumberToMinus
            case "÷": answerToReturn = (augend / addend) + randomNumberToMinus
            default: break
            }
            isAnswerCorrect = false
        }
        else {
            switch operatorToUse {
            case "+": answerToReturn = (augend + addend)
            case "−": answerToReturn = (augend - addend)
            case "×": answerToReturn = (augend * addend)
            case "÷": answerToReturn = (augend / addend)
            default: break
            }
            isAnswerCorrect = true
        }
        return (answerToReturn, isAnswerCorrect)
    }
}