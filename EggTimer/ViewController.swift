//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var eggTitle: UILabel!
    
    let eggTimes : [String : Int] = ["Soft": 5, "Medium": 7, "Hard": 12]
    var secondsRemaining: Int = 0;
    var timer = Timer()
    
    // Ranges a...b full inclusive
    // a..<b not including b
    // ..b upto including b but not greater than
    @IBAction func eggButtonPressed(_ sender: UIButton) {
        
        timer.invalidate()
        
        if sender.currentTitle != nil {
            let buttonTitle : String = sender.currentTitle!
            
            // We are syre since the current title comes from the button
            secondsRemaining = eggTimes[buttonTitle]!
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
                if self.secondsRemaining > 0 {
                    print("\(self.secondsRemaining) seconds.")
                    self.secondsRemaining += -1
                } else {
                    Timer.invalidate()
                    self.eggTitle.text = "Done"
                    
                }
            }
        }
    }
}
