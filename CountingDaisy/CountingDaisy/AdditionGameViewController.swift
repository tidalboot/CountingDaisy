//
//  AdditionGameViewController.swift
//  CountingDaisy
//
//  Created by Nick Jones on 26/03/2015.
//  Copyright (c) 2015 Nick Jones. All rights reserved.
//

import UIKit

class AdditionGameViewController: UIViewController {

    let randomNumberCalculator = RandomNumberCalculator()
    @IBOutlet var randomNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func generateRandomNumber(sender: AnyObject) {
        var randomNumber = randomNumberCalculator.generateRandomNumbers(1, minumumValue: 1, maximumValue: 1000)
        
        randomNumberLabel.text = "\(randomNumber[0])"
    }

}
