
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
        let highScores = highScoreHandler.retrieveHighScores()
        var totalScore = highScores.reduce(0, combine: +)
        let rank = Rank(Score: totalScore)
        
        let additionHighScore = highScoreHandler.retrieveHighScore("+")
        let subtractionHighScore = highScoreHandler.retrieveHighScore("−")
        let multiplicationHighScore = highScoreHandler.retrieveHighScore("×")
        let divisionHighScore = highScoreHandler.retrieveHighScore("÷")
        additionHighScoreLabel.text = "\(additionHighScore)"
        subtractionHighScoreLabel.text = "\(subtractionHighScore)"
        divisionHighScoreLabel.text = "\(divisionHighScore)"
        multiplicationHighScoreLabel.text = "\(multiplicationHighScore)"
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
            let optionSelected = sender as! String
            gameSceneController.gameTypeToLoad = optionSelected
        }
    }
    
    @IBAction func userSelectedGameType(sender: UIButton) {
        if let optionSelected = sender.titleLabel?.text {
            self.performSegueWithIdentifier("gameScene", sender: optionSelected)
        }
    }
}

