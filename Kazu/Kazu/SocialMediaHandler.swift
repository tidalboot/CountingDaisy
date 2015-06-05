//
//  SocialMediaHandler.swift
//  Kazu
//
//  Created by Nick Jones on 03/06/2015.
//  Copyright (c) 2015 Nick Jones. All rights reserved.
//

import Foundation
import UIKit
import Social

class SocialMediaHandler {
    
    func postToFacebook (textToPost: String, destinationViewController: UIViewController) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook) {
            var faceBookViewController: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            //            var shareImage = UIImage(named: "FacebookShare")
            faceBookViewController.editing = false
            //            faceBookViewController.addImage(shareImage)
            faceBookViewController.setInitialText("\(textToPost) \nCheck it out at: \nhttp://apple.co/1OVtyFI")
            destinationViewController.presentViewController(faceBookViewController, animated: true, completion: nil)
        }
    }
}
