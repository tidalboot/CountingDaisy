//
//  AdditionGameViewController.swift
//  CountingDaisy
//
//  Created by Nick Jones on 26/03/2015.
//  Copyright (c) 2015 Nick Jones. All rights reserved.
//

import UIKit
import AVFoundation

class AdditionGameViewController: UIViewController {

    let randomNumberCalculator = RandomNumberCalculator()
    let additionGameHandler = AdditionGameHandler()
    let soundController = SoundController()


    var successSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Pop_Success", ofType: "mp3")!)
    var failSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Pop_Fail", ofType: "mp3")!)
    var audioPlayer = AVAudioPlayer()
    var failAudioPlayer = AVAudioPlayer()
    
    
    var augend: Int = 0
    var addend: Int = 0
    var summation: Int = 0
    var score: Int = 0
    
    @IBOutlet var randomNumberLabel: UILabel!
    @IBOutlet var augendLabel: UILabel!
    @IBOutlet var addendLAbel: UILabel!
    @IBOutlet var summationLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var correctLabel: UILabel!
    @IBOutlet var incorrectLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextSetOfNumbers()
        incorrectLabel.hidden = true
        correctLabel.hidden = true
        
        audioPlayer = AVAudioPlayer(contentsOfURL: successSound, error: nil)
        audioPlayer.prepareToPlay()
        audioPlayer.volume = 0.4
        
        failAudioPlayer = AVAudioPlayer(contentsOfURL: failSound, error: nil)
        failAudioPlayer.prepareToPlay()
        failAudioPlayer.volume = 0.4
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
        incorrectLabel.hidden = true
        correctLabel.hidden = false
        soundController.playAudio(audioPlayer)
    }
    
    func wrongAnswer () {
        incorrectLabel.hidden = false
        correctLabel.hidden = true
        soundController.playAudio(failAudioPlayer)
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
    
}
