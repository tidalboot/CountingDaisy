//
//  SoundController.swift
//  CountingDaisy
//
//  Created by Nick Jones on 30/03/2015.
//  Copyright (c) 2015 Nick Jones. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

class SoundController {
    
    func createAudioPlayer (nameOfSoundToPlay: String, extensionOfSound: String) -> AVAudioPlayer {
        
        var sound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("\(nameOfSoundToPlay)", ofType: "\(extensionOfSound)")!)
        var newAudioPlayer = AVAudioPlayer()
        
        newAudioPlayer.prepareToPlay()
        newAudioPlayer.volume = 0.4
        
        return newAudioPlayer
    }
    
    func playAudio (audioToPlay: AVAudioPlayer) {
        if (audioToPlay.rate > 0) {
            audioToPlay.currentTime = 0
        }
        audioToPlay.play()
    }
    
}
