
import Foundation
import UIKit

public class GameHandler {
    
    var randomNumberCalculator = RandomNumberCalculator()
    var nodeHandler = NodeHandler()
    
    public init () {}
    
    public func generateResult (operatorToUse: String, augend: Int, addend: Int) -> (answer: Int, answerIsCorrect: Bool) {
        
        var answerToReturn: Int = 0
        var isAnswerCorrect: Bool
        var coinToss = Int(arc4random_uniform(10))
        
        if coinToss > 5 {
            var randomNumberToMinus = randomNumberCalculator.generateRandomNumber(-10, maximumValue: 10)
            if randomNumberToMinus == 0 {randomNumberToMinus + 1}
            
            return (calculate(operatorToUse, firstNumber: augend, secondNumber: addend) + randomNumberToMinus, false)
        }
        else {
            return (calculate(operatorToUse, firstNumber: augend, secondNumber: addend), true)
        }
    }
    
    func calculate (operatorToUse: String, firstNumber: Int, secondNumber: Int) -> Int {
        var answerToReturn: Int = 0
        
        switch operatorToUse {
        case "+": answerToReturn = (firstNumber + secondNumber)
        case "−": answerToReturn = (firstNumber - secondNumber)
        case "×": answerToReturn = (firstNumber * secondNumber)
        case "÷": answerToReturn = (firstNumber * secondNumber)
        default: break
        }
        return answerToReturn
    }
    
    
    func getNextSetOfNumbers (gameType: String, augendLabel: UILabel, addendLabel: UILabel, answerLabel: UILabel) -> Bool {
        var arrayOfRandomNumbers = []
        
        if gameType == "×" || gameType == "÷" {
            arrayOfRandomNumbers = randomNumberCalculator.generateRandomNumbers(2, minumumValue: 1, maximumValue: 9)
        } else {
            arrayOfRandomNumbers = randomNumberCalculator.generateRandomNumbers(2, minumumValue: 1, maximumValue: 30)
        }
        
        let firstNumber = arrayOfRandomNumbers[0] as! Int
        let secondNumber = arrayOfRandomNumbers[1] as! Int
        let answers = generateResult(gameType, augend: arrayOfRandomNumbers[0] as! Int, addend: secondNumber)
        
        
        if gameType != "÷" {
            nodeHandler.updateLabelsWithText([augendLabel, addendLabel, answerLabel], textToUpdateLabelsWith: ["\(firstNumber)", "\(secondNumber)", "\(answers.answer)" ])
            return answers.answerIsCorrect
        }
        
        nodeHandler.updateLabelsWithText([augendLabel, addendLabel, answerLabel], textToUpdateLabelsWith: ["\(answers.answer)", "\(secondNumber)", "\(firstNumber)" ])
        return answers.answerIsCorrect
        
    }
    
}