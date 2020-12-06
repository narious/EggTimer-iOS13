//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var eggTitle: UILabel!
    
    let eggTimes : [String : Int] = ["Soft": 5, "Medium": 7, "Hard": 12]
    var secondsRemaining: Int = 0;
    var selectedEggTime = 1;
    var timer = Timer()
    
    // Ranges a...b full inclusive
    // a..<b not including b
    // ..b upto including b but not greater than
    @IBAction func eggButtonPressed(_ sender: UIButton) {
        
        timer.invalidate()
        
        if sender.currentTitle != nil {
            let buttonTitle : String = sender.currentTitle!
            
            // We are syre since the current title comes from the button
            eggTitle.text = "Cooking..."
            secondsRemaining = eggTimes[buttonTitle]! * 60
            selectedEggTime = secondsRemaining
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
    }
    
    func setProgress(progress: Int) {
        progressBar.progress = Float(secondsRemaining) / Float(selectedEggTime)
    }
    
    @objc func updateTimer() {
        if secondsRemaining > 0 {
            print("\(secondsRemaining) seconds.")
            self.secondsRemaining += -1
            self.setProgress(progress: secondsRemaining)
            
        } else {
            eggTitle.text = "Done"
            setProgress(progress: secondsRemaining)
            
        }
    }
}
