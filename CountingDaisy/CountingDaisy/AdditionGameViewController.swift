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
    let additionGameHandler = AdditionGameHandler()
    
    @IBOutlet var randomNumberLabel: UILabel!
    @IBOutlet var augendLabel: UILabel!
    @IBOutlet var addendLAbel: UILabel!
    @IBOutlet var summationLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func generateRandomNumber(sender: AnyObject) {
        
        var arrayOfRandomNumbers = randomNumberCalculator.generateRandomNumbers(2, minumumValue: 1, maximumValue: 50)
        
        var augend = arrayOfRandomNumbers[0] as! Int
        var addend = arrayOfRandomNumbers[1] as! Int
        
        augendLabel.text = "\(augend)"
        addendLAbel.text = "\(addend)"
        summationLabel.text = "\(additionGameHandler.generateResult(augend, addend: addend))"
        
    }

}
