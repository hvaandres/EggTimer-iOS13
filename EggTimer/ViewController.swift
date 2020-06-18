//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progreeBar: UIProgressView!
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var timer = Timer()
    var player: AVAudioPlayer!
    var totalTime = 0
    var secondsPassed = 0
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        
        timer.invalidate()
        
        // Create a variable that will render the title of eggTimes
        
        let hardness = sender.currentTitle! // Soft, Medium, Hard
        
        // Call the variable totalTimes and make it equal to the array to know the seconds and raped it 
        
        totalTime = eggTimes[hardness]!
        
        // We need to make sure that the app will be able to reset the progress bar
        
        progreeBar.progress = 0.0
        secondsPassed = 0
        // We need to make sure that the title will change
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:  #selector(updateTimer), userInfo:nil, repeats: true)
    }
    
    // Create a function that will do the calculation for the seconds and the progress bar.
    
    // It is important to show the progress bar to make sure the end-user can see the progress through the time
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            
            secondsPassed += 1
            progreeBar.progress = Float(secondsPassed) / Float(totalTime)
            print(Float(secondsPassed) / Float(totalTime))


        } else {
            timer.invalidate()
            titleLabel.text = "Done!" // Send a message when is done
            
            // Add the sound to make sure will alarm the end-user when the timer will be done.
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
            
        }
    }
}
