//
//  AdditionGameViewController.swift
//  CountingDaisy
//
//  Created by Nick Jones on 26/03/2015.
//  Copyright (c) 2015 Nick Jones. All rights reserved.
//

import UIKit
import AVFoundation
import SpriteKit

class AdditionGameViewController: UIViewController {

    let randomNumberCalculator = RandomNumberCalculator()
    let additionGameHandler = AdditionGameHandler()
    let soundController = SoundController()
    let nodeHandler = NodeHandler()

    var successAudioPlayer = AVAudioPlayer()
    var failAudioPlayer = AVAudioPlayer()
    
    var augend: Int = 0
    var addend: Int = 0
    var summation: Int = 0
    var score: Int = 0
    var myTimer = NSTimer()
    var timeLeft = 10.0
    
    @IBOutlet var randomNumberLabel: UILabel!
    @IBOutlet var augendLabel: UILabel!
    @IBOutlet var addendLAbel: UILabel!
    @IBOutlet var summationLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var correctLabel: UILabel!
    @IBOutlet var incorrectLabel: UILabel!
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var yesButton: UIButton!
    @IBOutlet var noButton: UIButton!
    @IBOutlet var retryButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nodeHandler.hideNodes([incorrectLabel, correctLabel, retryButton])
        successAudioPlayer = soundController.createAudioPlayer("Pop_Success", extensionOfSound: "mp3")
        failAudioPlayer = soundController.createAudioPlayer("Pop_Fail", extensionOfSound: "mp3")
        nextSetOfNumbers()
        startTimer()
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
            incorrectLabel.text = "Game Over!"
        }
        else {
            timeLeft = timeLeft - 0.1
            timerLabel.text = ("\(rounded)")
        }
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
    
    func correctAnswer () {
        score++
        scoreLabel.text = "\(score)"
        nodeHandler.showNodes([correctLabel])
        nodeHandler.hideNodes([incorrectLabel])
        soundController.playAudio(successAudioPlayer)
        timeLeft = timeLeft + 1
    }
    
    func wrongAnswer () {
        nodeHandler.hideNodes([correctLabel])
        nodeHandler.showNodes([incorrectLabel])
        soundController.playAudio(failAudioPlayer)
        timeLeft = timeLeft - 2
    }
    
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
