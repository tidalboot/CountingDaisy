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
    
    @IBOutlet var facebookShareButton: UIButton!
    @IBOutlet var contentView: UIView!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var retryButton: UIButton!
    @IBAction func touchedRetry(sender: AnyObject) {}

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.frame = CGRect(x: 0, y: 0, width: 300, height: 400)
        contentView.layer.cornerRadius = 2
        
        let facebookLoginButton: FBSDKLoginButton = FBSDKLoginButton()
        facebookLoginButton.center.x = self.view.center.x
        facebookLoginButton.center.y = self.view.center.y + 150
        self.view.addSubview(facebookLoginButton)
    }
}
