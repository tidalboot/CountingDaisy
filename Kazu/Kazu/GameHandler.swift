
import Foundation
import UIKit

public class GameHandler {
    
    var randomNumberCalculator = RandomNumberCalculator()
    var nodeHandler = NodeHandler()
    
    public init(){}
    
    public func getNextSetOfNumbers (gameType: GameMode, augendLabel: UILabel, addendLabel: UILabel, answerLabel: UILabel) -> Bool {
        var arrayOfRandomNumbers = []
        
        switch gameType {
            case .division, .multiplication:
                arrayOfRandomNumbers = randomNumberCalculator.generateRandomNumbers(2, minumumValue: 1, maximumValue: 9)
            case .addition, .subtraction:
                arrayOfRandomNumbers = randomNumberCalculator.generateRandomNumbers(2, minumumValue: 1, maximumValue: 30)
        }

        let answers = generateResult(gameType, augend: arrayOfRandomNumbers[0] as! Int, addend: arrayOfRandomNumbers[1] as! Int)
        
        if gameType != GameMode.division {
            nodeHandler.updateLabelsWithText([augendLabel, addendLabel, answerLabel], textToUpdateLabelsWith: ["\(arrayOfRandomNumbers[0])", "\(arrayOfRandomNumbers[1])", "\(answers.answer)" ])
            return answers.answerIsCorrect
        }
        
        nodeHandler.updateLabelsWithText([augendLabel, addendLabel, answerLabel], textToUpdateLabelsWith: ["\(answers.answer)", "\(arrayOfRandomNumbers[1])", "\(arrayOfRandomNumbers[0])" ])
        return answers.answerIsCorrect
    }
    
    
    public func generateResult (operatorToUse: GameMode, augend: Int, addend: Int) -> (answer: Int, answerIsCorrect: Bool) {
        let coinToss = Int(arc4random_uniform(10))
        if coinToss > 5 {
            let randomNumberToMinus = randomNumberCalculator.generateRandomNumber(-10, maximumValue: 10)
            if randomNumberToMinus == 0 {randomNumberToMinus + 1}
            return (calculate(operatorToUse, firstNumber: augend, secondNumber: addend) + randomNumberToMinus, false)
        }
        else {
            return (calculate(operatorToUse, firstNumber: augend, secondNumber: addend), true)
        }
    }
    
    public func calculate (operatorToUse: GameMode, firstNumber: Int, secondNumber: Int) -> Int {
        var answerToReturn: Int = 0
        switch operatorToUse {
        case .addition: answerToReturn = (firstNumber + secondNumber)
        case .subtraction: answerToReturn = (firstNumber - secondNumber)
        case .multiplication, .division: answerToReturn = (firstNumber * secondNumber)
        }
        return answerToReturn
    }
}