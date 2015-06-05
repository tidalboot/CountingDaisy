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
    
    func addPopoverViewWithFade (viewToPopover: UIView, viewControllerToFade: UIViewController) {
        var fadeView = UIView(frame: CGRect(x: 0, y: 0, width: viewControllerToFade.view.frame.width, height: viewControllerToFade.view.frame.height))
        fadeView.backgroundColor = viewControllerToFade.view.backgroundColor
        fadeView.alpha = 0
        viewToPopover.alpha = 0
        viewToPopover.center = viewControllerToFade.view.center
        viewToPopover.center.y += 100
        
        UIView.animateWithDuration(0.5, animations: {
            fadeView.alpha = 0.8
            viewToPopover.alpha = 1
            viewToPopover.center.y = viewControllerToFade.view.center.y
        })
        
        viewsAdded = [fadeView, viewToPopover]
        viewControllerToFade.view.addSubview(fadeView)
        viewControllerToFade.view.addSubview(viewToPopover)
    }
    
    
    func removeViews (viewToRemoveViewsFrom: UIViewController) {
        for views in viewsAdded {
            var viewToRemove = views as! UIView
            viewToRemove.removeFromSuperview()
        }
    }
}