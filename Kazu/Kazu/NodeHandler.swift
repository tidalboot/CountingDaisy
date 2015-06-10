//
//  NodeHandler.swift
//  Kazu
//
//  Created by Nick Jones on 31/03/2015.
//  Copyright (c) 2015 Nick Jones. All rights reserved.
//

import Foundation
import UIKit

class NodeHandler {
    
    func hideNodes (objectsToHide: [UIView]) {
        let objectArray = objectsToHide
        for object in objectArray {
            if object is UIActivityIndicatorView {
                (object as! UIActivityIndicatorView).stopAnimating()
                object.hidden = true
            }
            else {
                object.hidden = true
            }
        }
    }
    
    func showNodes (objectsToShow: [UIView]) {
        let objectArray = objectsToShow
        for object in objectArray {
            if object is UIActivityIndicatorView {
                (object as! UIActivityIndicatorView).startAnimating()
                object.hidden = false
            }
            else {
                object.hidden = false
            }
        }
    }
    
    func updateLabelsWithText (labelsToUpdate: [UILabel], textToUpdateLabelsWith: [String]) {
        for (index, label) in enumerate(labelsToUpdate) {
            label.text = textToUpdateLabelsWith[index]
        }
    }
    
//    func updateLabelsWithNumbers (labelsToUpdate: [UILabel], textToUpdateLabelsWith: [Float]) {
//        for (index, label) in enumerate(labelsToUpdate) {
//            label.text = "\(textToUpdateLabelsWith[index])"
//        }
//    }
    
}