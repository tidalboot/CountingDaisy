
import UIKit

class MainMenuViewController: UIViewController {
    
    let highScoreHandler = HighScoreHandler()
        
    @IBOutlet var additionImage: UIImageView!
    @IBOutlet var additionHighScoreLabel: UILabel!
    @IBOutlet var totalScoreLabel: UILabel!
    @IBOutlet var rankLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let loadGameScene = UITapGestureRecognizer(target: self, action: "userTappedScreen")
        additionImage.addGestureRecognizer(loadGameScene)
        additionHighScoreLabel.text = "\(highScoreHandler.retrieveHighScore())"
        totalScoreLabel.text = "\(highScoreHandler.retrieveHighScore())"
    }
    
    @IBAction func unwindToHomeScreen (segue: UIStoryboardSegue) {
        
    }
        
    func userTappedScreen () {
        self.performSegueWithIdentifier("gameScene", sender: self)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}

