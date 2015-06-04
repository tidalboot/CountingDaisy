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
    
    var viewsAdded = []
    
    func fadeCurrentView (viewToFade: UIViewController, viewToOverlay: UIView) {
        var fadeView = UIView(frame: CGRect(x: 0, y: 0, width: viewToFade.view.frame.width, height: viewToFade.view.frame.height))
        fadeView.backgroundColor = viewToFade.view.backgroundColor
        fadeView.alpha = 0
        viewToOverlay.alpha = 0
        viewToOverlay.center.x = viewToFade.view.center.x
        viewToOverlay.center.y = viewToFade.view.center.y + 100
        
        UIView.animateWithDuration(0.5, animations: {
            fadeView.alpha = 0.8
            viewToOverlay.alpha = 1
            viewToOverlay.center.y = viewToFade.view.center.y
        })
        
        viewsAdded = [fadeView, viewToOverlay]
        viewToFade.view.addSubview(fadeView)
        viewToFade.view.addSubview(viewToOverlay)
    }
    
    func removeViews (viewToRemoveViewsFrom: UIViewController) {
        for views in viewsAdded {
            var viewToRemove = views as! UIView
            viewToRemove.removeFromSuperview()
        }
    }
}