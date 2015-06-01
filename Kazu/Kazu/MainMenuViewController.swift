
import UIKit

class MainMenuViewController: UIViewController {
    
    let highScoreHandler = HighScoreHandler()

    @IBOutlet var additionHighScoreLabel: UILabel!
    @IBOutlet var totalScoreLabel: UILabel!
    @IBOutlet var subtractionHighScoreLabel: UILabel!
    @IBOutlet var rankLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        additionHighScoreLabel.text = "\(highScoreHandler.retrieveHighScore())"
        totalScoreLabel.text = "\(highScoreHandler.retrieveHighScore())"
    }
    
    @IBAction func unwindToHomeScreen (segue: UIStoryboardSegue) {}
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "gameScene" {
            let gameSceneController = segue.destinationViewController as! AdditionGameViewController
            let optionSelected = sender as! String
            gameSceneController.gameTypeToLoad = optionSelected
        }
    }
    
    @IBAction func userSelectedGameType(sender: UIButton) {
        if let optionSelected = sender.titleLabel?.text {
            userTappedScreen(optionSelected)
        }
    }
    
    func userTappedScreen (optionSelected: String) {
        self.performSegueWithIdentifier("gameScene", sender: optionSelected)
    }
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}

