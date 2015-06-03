
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
    @IBOutlet var retryButton: UIButton!

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
    var popoverView: UIView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.gameOverViewController = GameOverViewController.new()
        var customViewObject: AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("GameOver")
        gameOverViewController = customViewObject as! GameOverViewController
        popoverView = gameOverViewController.view
 
        gameOverViewController.retryButton.addTarget(self, action: "clickedRetry", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        nodeHandler.hideNodes([incorrectLabel, correctLabel, retryButton])
        operatorLabel.text = gameTypeToLoad
        successAudioPlayer = soundHandler.createAudioPlayer("Pop_Success", extensionOfSound: "mp3")
        failAudioPlayer = soundHandler.createAudioPlayer("Pop_Fail", extensionOfSound: "mp3")
        nextSetOfNumbers()
        startTimer()
    }
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func nextSetOfNumbers () {
        var arrayOfRandomNumbers = randomNumberCalculator.generateRandomNumbers(2, minumumValue: 1, maximumValue: 30)
        firstNumber = arrayOfRandomNumbers[0] as! Int
        secondNumber = arrayOfRandomNumbers[1] as! Int
        answers = gameHandler.generateResult(gameTypeToLoad, augend: firstNumber, addend: secondNumber)
        augendLabel.text = "\(firstNumber)"
        addendLabel.text = "\(secondNumber)"
        summationLabel.text = "\(answers.answer)"
    }
    
    func startTimer () {
        myTimer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("updateTimerLabel"), userInfo: nil, repeats: true)
    }
    
    func updateTimerLabel () {
        var rounded = round(timeLeft*10)/10
        if timeLeft <= 0 {
            myTimer.invalidate()
            nodeHandler.hideNodes([noButton, yesButton, timerLabel, correctLabel, augendLabel, addendLabel, operatorLabel, equalsLabel, summationLabel])
            nodeHandler.showNodes([incorrectLabel, retryButton])
            highScoreHandler.setHighScore(score, highScoreToSet: gameTypeToLoad)
            incorrectLabel.text = "Game Over!"
            gameOverViewController.scoreLabel.text = "\(score)"
            viewHandler.fadeCurrentView(self, viewToOverlay: popoverView)
        }
        else {
            timeLeft = timeLeft - 0.1
            timerLabel.text = ("\(rounded)")
        }
    }
    

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

    
    @IBAction func facebookShare(sender: AnyObject) {
        socialMediaHandler.postToFacebook("I got \(score) on Kazu!", destinationViewController: self)
    }

    
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


    func clickedRetry () {
        nodeHandler.showNodes([noButton, yesButton, timerLabel, augendLabel, addendLabel, operatorLabel, equalsLabel, summationLabel])
        nodeHandler.hideNodes([correctLabel, incorrectLabel, retryButton])
        incorrectLabel.text = "Not quite"
        score = 0
        timeLeft = 10
        startTimer()
        viewHandler.removeViews(self)
    }
}


//End of the line...