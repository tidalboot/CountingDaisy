
import UIKit

class MainMenuViewController: UIViewController {
    
    let highScoreHandler = HighScoreHandler()
    @IBOutlet var totalScoreLabel: UILabel!
    @IBOutlet var additionHighScoreLabel: UILabel!
    @IBOutlet var subtractionHighScoreLabel: UILabel!
    @IBOutlet var divisionHighScoreLabel: UILabel!
    @IBOutlet var multiplicationHighScoreLabel: UILabel!
    @IBOutlet var rankLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateHighScores()
    }
    
    
    func updateHighScores () {
        let additionHighScore = highScoreHandler.retrieveHighScore("+")
        let subtractionHighScore = highScoreHandler.retrieveHighScore("−")
        let multiplicationHighScore = highScoreHandler.retrieveHighScore("×")
        let divisionHighScore = highScoreHandler.retrieveHighScore("÷")
        additionHighScoreLabel.text = "\(additionHighScore)"
        subtractionHighScoreLabel.text = "\(subtractionHighScore)"
        divisionHighScoreLabel.text = "\(divisionHighScore)"
        multiplicationHighScoreLabel.text = "\(multiplicationHighScore)"
        totalScoreLabel.text = "\(additionHighScore + subtractionHighScore + multiplicationHighScore + divisionHighScore)"
    }
    
    //Remove on release
    @IBAction func resetScores(sender: AnyObject) {
        highScoreHandler.resetHighScore()
        updateHighScores()
    }
    
    @IBAction func unwindToHomeScreen (segue: UIStoryboardSegue) {
        updateHighScores()
    }
    
    //Remove on release
    @IBAction func checkScores(sender: AnyObject) {
        highScoreHandler.checkScoreStore()
    }
    
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

