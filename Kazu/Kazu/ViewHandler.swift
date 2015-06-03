//
//  ViewHandler.swift
//  Kazu
//
//  Created by Nick Jones on 03/06/2015.
//  Copyright (c) 2015 Nick Jones. All rights reserved.
//

import Foundation
import UIKit

class ViewHandler {
    
    func fadeCurrentView (viewToFade: UIViewController) {
        var fadeView = UIView(frame: CGRect(x: 0, y: 0, width: viewToFade.view.frame.width, height: viewToFade.view.frame.height))
        fadeView.backgroundColor = viewToFade.view.backgroundColor
        fadeView.alpha = 0
        UIView.animateWithDuration(0.5, animations: {
            fadeView.alpha = 0.8
        })
        viewToFade.view.addSubview(fadeView)
    }
}