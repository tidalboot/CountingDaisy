
import UIKit
import AVFoundation
import SpriteKit

class GameViewController: UIViewController, UIPopoverControllerDelegate {
    
    let randomNumberCalculator = RandomNumberCalculator()
    let gameHandler = GameHandler()
    let soundHandler = SoundHandler()
    let nodeHandler = NodeHandler()
    let highScoreHandler = HighScoreHandler()
    let socialMediaHandler = SocialMediaHandler()
    let viewHandler = ViewHandler()
    
    //Frigging outlets..... Spam my code will you...
    //Label Outlets
    @IBOutlet var augendLabel: UILabel!
    @IBOutlet var addendLabel: UILabel!
    @IBOutlet var summationLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var correctLabel: UILabel!
    @IBOutlet var incorrectLabel: UILabel!
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var operatorLabel: UILabel!
    @IBOutlet var equalsLabel: UILabel!
    //Button Outlets
    @IBOutlet var yesButton: UIButton!
    @IBOutlet var noButton: UIButton!

    //Ahhhh lovely variables
    var successAudioPlayer = AVAudioPlayer()
    var failAudioPlayer = AVAudioPlayer()
    
    var myTimer = NSTimer()
    var firstNumber: Int = 0
    var secondNumber: Int = 0
    var answers: (answer: Int, answerIsCorrect: Bool)!
    var score: Int = 0
    var timeLeft = 10.0
    var gameTypeToLoad: String!
    var gameOverViewController: GameOverViewController!
    
    override func viewDidLoad() {
        self.gameOverViewController = GameOverViewController.new()
        var customViewObject: AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("GameOver")
        gameOverViewController = customViewObject as! GameOverViewController
        let popoverView = gameOverViewController.view
 
        gameOverViewController.retryButton.addTarget(self, action: "clickedRetry", forControlEvents: UIControlEvents.TouchUpInside)
        
        operatorLabel.text = gameTypeToLoad
        successAudioPlayer = soundHandler.createAudioPlayer("Pop_Success", extensionOfSound: "mp3")
        failAudioPlayer = soundHandler.createAudioPlayer("Pop_Fail", extensionOfSound: "mp3")
        startNewGame()
    }
    
    
    func nextSetOfNumbers () {
        var arrayOfRandomNumbers = []
        if gameTypeToLoad == "×" {
            arrayOfRandomNumbers = randomNumberCalculator.generateRandomNumbers(2, minumumValue: 1, maximumValue: 15)
        }
        else {
            arrayOfRandomNumbers = randomNumberCalculator.generateRandomNumbers(2, minumumValue: 1, maximumValue: 30)
        }
        firstNumber = arrayOfRandomNumbers[0] as! Int
        secondNumber = arrayOfRandomNumbers[1] as! Int
        
        answers = gameHandler.generateResult(gameTypeToLoad, augend: firstNumber, addend: secondNumber)

        nodeHandler.updateLabelsWithText([augendLabel, addendLabel, summationLabel], textToUpdateLabelsWith: ["\(firstNumber)", "\(secondNumber)", "\(answers.answer)" ])
    }
    
    
    //Timer handling
    func startNewGame () {
        score = 0
        scoreLabel.text = "\(score)"
        timeLeft = 10
        nextSetOfNumbers()
        myTimer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("updateTimerLabel"), userInfo: nil, repeats: true)
    }
    
    func gameOver () {
        myTimer.invalidate()
        nodeHandler.hideNodes([noButton, yesButton, timerLabel, correctLabel, augendLabel, addendLabel, operatorLabel, equalsLabel, summationLabel])
        nodeHandler.showNodes([incorrectLabel])
        highScoreHandler.setHighScore(score, highScoreToSet: gameTypeToLoad)
        gameOverViewController.scoreLabel.text = "\(score)"
        viewHandler.fadeCurrentView(self, viewToOverlay: gameOverViewController.view)
    }
    
    func updateTimerLabel () {
        var rounded = round(timeLeft*10)/10
        if timeLeft <= 0 {
            gameOver()
        }
        else {
            timeLeft = timeLeft - 0.1
            timerLabel.text = ("\(rounded)")
        }
    }
    
    //Game handlers
    func answer (correctAnswer: Bool) {
        if correctAnswer {
            score++
            scoreLabel.text = "\(score)"
            nodeHandler.showNodes([correctLabel])
            nodeHandler.hideNodes([incorrectLabel])
            soundHandler.playAudio(successAudioPlayer)
            timeLeft = timeLeft + 1
        }
        else {
            nodeHandler.hideNodes([correctLabel])
            nodeHandler.showNodes([incorrectLabel])
            soundHandler.playAudio(failAudioPlayer)
            timeLeft = timeLeft - 5
        }
        nextSetOfNumbers()
    }
    
    //Button handling
    @IBAction func userSelectedAnswer(sender: UIButton) {
        if sender.titleLabel?.text! == "Yes" {
            if answers.answerIsCorrect {
                answer(true)
            }
            else {
                answer(false)
            }
        }
        else {
            if answers.answerIsCorrect {
                answer(false)
            }
            else {
                answer(true)
            }
        }
    }

    @IBAction func facebookShare(sender: AnyObject) {
        socialMediaHandler.postToFacebook("I got \(score) on Kazu!", destinationViewController: self)
    }

    func clickedRetry () {
        nodeHandler.showNodes([noButton, yesButton, timerLabel, augendLabel, addendLabel, operatorLabel, equalsLabel, summationLabel])
        nodeHandler.hideNodes([correctLabel, incorrectLabel])
        viewHandler.removeViews(self)
        startNewGame()
    }
}


//End of the line...