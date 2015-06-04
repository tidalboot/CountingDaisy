//
//  GameOverViewController.swift
//  Kazu
//
//  Created by Nick Jones on 03/06/2015.
//  Copyright (c) 2015 Nick Jones. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import FBSDKShareKit

class GameOverViewController: UIViewController, UIGestureRecognizerDelegate {

    let viewHandler = ViewHandler()
    
    @IBOutlet var contentView: UIView!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var retryButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "lolol"
        contentView.frame = CGRect(x: 0, y: 0, width: 250, height: 350)
        contentView.layer.cornerRadius = 2
        
        let facebookLoginButton: FBSDKLoginButton = FBSDKLoginButton()
        facebookLoginButton.center.x = self.view.center.x
        facebookLoginButton.center.y = self.view.center.y + 150
        self.view.addSubview(facebookLoginButton)
    }

    override func viewDidDisappear(animated: Bool) {
        println("It's dead Jim")
    }
    
    @IBAction func touchedRetry(sender: AnyObject) {
//        println("asda")
//        self.removeFromParentViewController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
