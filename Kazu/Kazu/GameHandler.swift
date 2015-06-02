
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
            return (calculate(operatorToUse, firstNumber: augend, secondNumber: addend) + randomNumberToMinus, false)
        }
        else {
            return (calculate(operatorToUse, firstNumber: addend, secondNumber: augend), true)
        }
    }
    
    func calculate (operatorToUse: String, firstNumber: Int, secondNumber: Int) -> Int {
        var answerToReturn: Int = 0
        
        switch operatorToUse {
        case "+": answerToReturn = (firstNumber + secondNumber)
        case "−": answerToReturn = (firstNumber - secondNumber)
        case "×": answerToReturn = (firstNumber * secondNumber)
        case "÷": answerToReturn = (firstNumber / secondNumber)
        default: break
        }
        return answerToReturn
    }
}