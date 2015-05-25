
import Foundation
import AVFoundation
import UIKit

class SoundHandler {
    
    func createAudioPlayer (nameOfSoundToPlay: String, extensionOfSound: String) -> AVAudioPlayer {
        var sound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("\(nameOfSoundToPlay)", ofType: "\(extensionOfSound)")!)
        var newAudioPlayer = AVAudioPlayer(contentsOfURL: sound, error: nil)
        
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
