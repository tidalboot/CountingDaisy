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

class GameOverViewController: UIViewController {

    @IBOutlet var contentView: UIView!
    @IBOutlet var scoreLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "lolol"
        contentView.frame = CGRect(x: 0, y: 0, width: 250, height: 350)
        contentView.layer.cornerRadius = 10
        
        let facebookLoginButton: FBSDKLoginButton = FBSDKLoginButton()
        facebookLoginButton.center.x = self.view.center.x
        facebookLoginButton.center.y = self.view.center.y + 200
        self.view.addSubview(facebookLoginButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
