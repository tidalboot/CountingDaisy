
import UIKit

class MainMenuViewController: UIViewController {
    
    let highScoreHandler = HighScoreHandler()
    @IBOutlet var totalScoreLabel: UILabel!
    @IBOutlet var additionHighScoreLabel: UILabel!
    @IBOutlet var subtractionHighScoreLabel: UILabel!
    @IBOutlet var divisionHighScoreLabel: UILabel!
    @IBOutlet var multiplicationHighScoreLabel: UILabel!
    @IBOutlet var rankLabel: UILabel!
    @IBOutlet var pointsToNextRankLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateHighScores()
    }
    
    func updateHighScores () {
        let totalScore = highScoreHandler.retrieveTotalScore()
        let rank = Rank(Score: totalScore)
        
        additionHighScoreLabel.text = "\(highScoreHandler.retrieveHighScore(GameMode.addition.rawValue))"
        subtractionHighScoreLabel.text = "\(highScoreHandler.retrieveHighScore(GameMode.subtraction.rawValue))"
        divisionHighScoreLabel.text = "\(highScoreHandler.retrieveHighScore(GameMode.division.rawValue))"
        multiplicationHighScoreLabel.text = "\(highScoreHandler.retrieveHighScore(GameMode.multiplication.rawValue))"
        totalScoreLabel.text = "\(totalScore)"
        rankLabel.text = "\(rank.currentRank)"
        pointsToNextRankLabel.text = "\(rank.pointsToNextRank) points to next rank"
    }
    
    @IBAction func unwindToHomeScreen (segue: UIStoryboardSegue) {
        updateHighScores()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "gameScene" {
            let gameSceneController = segue.destinationViewController as! GameViewController
            switch sender as! String {
            case GameMode.addition.rawValue:
                gameSceneController.gameTypeToLoad = GameMode.addition
            case GameMode.subtraction.rawValue:
                gameSceneController.gameTypeToLoad = GameMode.subtraction
            case GameMode.division.rawValue:
                gameSceneController.gameTypeToLoad = GameMode.division
            case GameMode.multiplication.rawValue:
                gameSceneController.gameTypeToLoad = GameMode.multiplication
            default:break
            }
        }
    }
    
    @IBAction func userSelectedGameType(sender: UIButton) {
        if let optionSelected = sender.titleLabel?.text {
            self.performSegueWithIdentifier("gameScene", sender: optionSelected)
        }
    }
}

