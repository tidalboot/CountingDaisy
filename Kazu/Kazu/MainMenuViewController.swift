
import UIKit

class MainMenuViewController: UIViewController {
        
    @IBOutlet var additionImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let loadGameScene = UITapGestureRecognizer(target: self, action: "userTappedScreen")
        additionImage.addGestureRecognizer(loadGameScene)
    }
    
    func userTappedScreen () {
        self.performSegueWithIdentifier("gameScene", sender: self)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}

