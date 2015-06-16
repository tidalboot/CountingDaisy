
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
    
    @IBOutlet var augendLabel: UILabel!
    @IBOutlet var addendLabel: UILabel!
    @IBOutlet var summationLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var correctLabel: UILabel!
    @IBOutlet var incorrectLabel: UILabel!
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var operatorLabel: UILabel!
    @IBOutlet var equalsLabel: UILabel!
    @IBOutlet var countDownLabel: UILabel!
    
    //Button Outlets
    @IBOutlet var yesButton: UIButton!
    @IBOutlet var noButton: UIButton!

    //Ahhhh lovely variables
    var successAudioPlayer = AVAudioPlayer()
    var failAudioPlayer = AVAudioPlayer()
    var countdownAudioPlayer = AVAudioPlayer()
    
    var myTimer = NSTimer()
    var countDownTimer = NSTimer()
    var score: Int = 0
    var wrongAnswers: Int = 0
    var firstNumber: Int = 0
    var secondNumber: Int = 0
    var countDown = 4
    var timeLeft = 10.0
    var answerIsCorrect: Bool!
    var gameTypeToLoad: String!
    var gameOverViewController: GameOverViewController!
    
    override func viewDidLoad() {
        let gameOverStoryboardView: AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("GameOver")
        gameOverViewController = gameOverStoryboardView as! GameOverViewController
        let popoverView = gameOverViewController.view
 
        gameOverViewController.homeButton.addTarget(self, action: "goHome", forControlEvents: UIControlEvents.TouchUpInside)
        gameOverViewController.retryButton.addTarget(self, action: "clickedRetry", forControlEvents: UIControlEvents.TouchUpInside)
        gameOverViewController.facebookShareButton.addTarget(self, action: "facebookShare", forControlEvents: UIControlEvents.TouchUpInside)

        operatorLabel.text = gameTypeToLoad
        successAudioPlayer = soundHandler.createAudioPlayer("Pop_Success", extensionOfSound: "mp3")
        failAudioPlayer = soundHandler.createAudioPlayer("Pop_Fail", extensionOfSound: "mp3")
        countdownAudioPlayer = soundHandler.createAudioPlayer("Countdown", extensionOfSound: "mp3")
        startCountdown()
        
        
        println(123)
    }
    
    func goHome () {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func startCountdown () {
        let genericView = UILabel()
        viewHandler.addPopoverViewWithFade(genericView, viewControllerToFade: self)
        countDownLabel.hidden = false
        self.view.bringSubviewToFront(countDownLabel)
        countDownTimer = NSTimer.scheduledTimerWithTimeInterval(0.9, target: self, selector: Selector("runCountdown"), userInfo: nil, repeats: true)
    }
    
    func runCountdown () {
        countDown--
        soundHandler.playAudio(countdownAudioPlayer)
            if countDown <= 0 {
                countDown = 4
                countDownTimer.invalidate()
                viewHandler.removeViews(self)
                countDownLabel.hidden = true
                nodeHandler.showNodes([noButton, yesButton, timerLabel, augendLabel, addendLabel, operatorLabel, equalsLabel, summationLabel])
                startNewGame()
            }
        countDownLabel.text = ("\(countDown)")
    }
    
    //Timer handling
    func startNewGame () {
        score = 0
        wrongAnswers = 0
        scoreLabel.text = "\(score)"
        timeLeft = 10
        nextSetOfNumbers()
        myTimer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("updateTimerLabel"), userInfo: nil, repeats: true)
    }
    
    func updateTimerLabel () {
        let rounded = round(timeLeft*10)/10
        if timeLeft <= 0 {
            gameOver()
        } else {
            timeLeft = timeLeft - 0.1
            timerLabel.text = ("\(rounded)")
        }
    }
    
    func gameOver () {
        myTimer.invalidate()
        nodeHandler.hideNodes([noButton, yesButton, timerLabel, correctLabel, augendLabel, addendLabel, operatorLabel, equalsLabel, summationLabel])
        nodeHandler.showNodes([incorrectLabel])
        highScoreHandler.setHighScore(score, highScoreToSet: gameTypeToLoad)
        gameOverViewController.scoreLabel.text = "\(score)"
        gameOverViewController.wrongAnswersLabel.text = "\(wrongAnswers)"
        viewHandler.addPopoverViewWithFade(gameOverViewController.view,viewControllerToFade: self)
    }
    
    func answer (correctAnswer: Bool) {
        if correctAnswer {
            score++
            scoreLabel.text = "\(score)"
            nodeHandler.showNodes([correctLabel])
            nodeHandler.hideNodes([incorrectLabel])
            soundHandler.playAudio(successAudioPlayer)
            timeLeft = timeLeft + 1
        } else {
            nodeHandler.hideNodes([correctLabel])
            nodeHandler.showNodes([incorrectLabel])
            soundHandler.playAudio(failAudioPlayer)
            wrongAnswers++
            timeLeft = timeLeft - 5
        }
        nextSetOfNumbers()
    }
    
    func nextSetOfNumbers () {
        answerIsCorrect = gameHandler.getNextSetOfNumbers(gameTypeToLoad, augendLabel: augendLabel, addendLabel: addendLabel, answerLabel: summationLabel)
    }
    
    //Button handling
    @IBAction func userSelectedAnswer(sender: UIButton) {
        if sender.titleLabel?.text! == "Yes" {
            if answerIsCorrect! {answer(true)}
            else {answer(false)}
        }
        else {if answerIsCorrect! {answer(false)}
            else {answer(true)}
        }
    }

    func clickedRetry () {
        nodeHandler.hideNodes([correctLabel, incorrectLabel])
        viewHandler.removeViews(self)
        startCountdown()
    }
    
    func facebookShare() {
        socialMediaHandler.postToFacebook("I got \(score) on Kazu!", destinationViewController: self)
    }
}


//End of the line...