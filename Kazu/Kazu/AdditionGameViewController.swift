
import UIKit
import AVFoundation
import SpriteKit

class AdditionGameViewController: UIViewController {
    
    let randomNumberCalculator = RandomNumberCalculator()
    let additionGameHandler = AdditionGameHandler()
    let soundHandler = SoundHandler()
    let nodeHandler = NodeHandler()
    let highScoreHandler = HighScoreHandler()
    
    //Frigging outlets..... Spam my code will you...
    //Label Outlets
    @IBOutlet var augendLabel: UILabel!
    @IBOutlet var addendLAbel: UILabel!
    @IBOutlet var summationLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var correctLabel: UILabel!
    @IBOutlet var incorrectLabel: UILabel!
    @IBOutlet var timerLabel: UILabel!
    //Button Outlets
    @IBOutlet var yesButton: UIButton!
    @IBOutlet var noButton: UIButton!
    @IBOutlet var retryButton: UIButton!

    //Ahhhh lovely variables
    var successAudioPlayer = AVAudioPlayer()
    var failAudioPlayer = AVAudioPlayer()
    
    var myTimer = NSTimer()
    var augend: Int = 0
    var addend: Int = 0
    var summation: Int = 0
    var score: Int = 0
    var timeLeft = 10.0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        nodeHandler.hideNodes([incorrectLabel, correctLabel, retryButton])
        successAudioPlayer = soundHandler.createAudioPlayer("Pop_Success", extensionOfSound: "mp3")
        failAudioPlayer = soundHandler.createAudioPlayer("Pop_Fail", extensionOfSound: "mp3")
        nextSetOfNumbers()
        startTimer()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func nextSetOfNumbers () {
        var arrayOfRandomNumbers = randomNumberCalculator.generateRandomNumbers(2, minumumValue: 1, maximumValue: 50)
        augend = arrayOfRandomNumbers[0] as! Int
        addend = arrayOfRandomNumbers[1] as! Int
        summation = additionGameHandler.generateResult(augend, addend: addend)
        augendLabel.text = "\(augend)"
        addendLAbel.text = "\(addend)"
        summationLabel.text = "\(summation)"
    }
    
    func startTimer () {
        myTimer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("updateTimerLabel"), userInfo: nil, repeats: true)
    }
    
    func updateTimerLabel () {
        var rounded = round(timeLeft*10)/10
        if timeLeft <= 0 {
            myTimer.invalidate()
            nodeHandler.hideNodes([noButton, yesButton, timerLabel, correctLabel])
            nodeHandler.showNodes([incorrectLabel, retryButton])
            highScoreHandler.setHighScore(score)
            incorrectLabel.text = "Game Over!"
        }
        else {
            timeLeft = timeLeft - 0.1
            timerLabel.text = ("\(rounded)")
        }
    }
    
    func correctAnswer () {
        score++
        scoreLabel.text = "\(score)"
        nodeHandler.showNodes([correctLabel])
        nodeHandler.hideNodes([incorrectLabel])
        soundHandler.playAudio(successAudioPlayer)
        timeLeft = timeLeft + 1
    }
    
    func wrongAnswer () {
        nodeHandler.hideNodes([correctLabel])
        nodeHandler.showNodes([incorrectLabel])
        soundHandler.playAudio(failAudioPlayer)
        timeLeft = timeLeft - 3
    }
    
    
    //Button clicks
    @IBAction func clickedYes(sender: AnyObject) {
        if summation == (augend + addend) {
            correctAnswer()
        }
        else {
            wrongAnswer()
        }
        nextSetOfNumbers()
    }

    @IBAction func clickedNo(sender: AnyObject) {
        if summation != (augend + addend) {
            correctAnswer()
        }
        else {
           wrongAnswer()
        }
        nextSetOfNumbers()
    }
    
    @IBAction func clickedRetry(sender: AnyObject) {
        nodeHandler.showNodes([noButton, yesButton, timerLabel])
        nodeHandler.hideNodes([correctLabel, incorrectLabel, retryButton])
        incorrectLabel.text = "Not quite"
        score = 0
        timeLeft = 10
        startTimer()
    }
}


//End of the line...