//
//  ViewController.swift
//  Egg Timer
//
//  Created by David E Bratton on 10/19/18.
//  Copyright © 2018 David Bratton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer = Timer()
    var seconds = 210
    
    @IBOutlet weak var timerTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerTextLabel.text = "210"
    }
    
    @objc func processTimer() {
        seconds -= 1
        timerTextLabel.text = "\(seconds)"
        
        if seconds == 0 {
            timer.invalidate()
        }
    }
    
    func startTime() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.processTimer), userInfo: nil, repeats: true)
    }

    @IBAction func pauseButtonPressed(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func playButtonPressed(_ sender: Any) {
        startTime()
    }
    
    @IBAction func subtractButtonPressed(_ sender: Any) {
        if seconds > 10 {
            //seconds = seconds - 10
            seconds -= 10
            timerTextLabel.text = "\(seconds)"
        }
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        //seconds = seconds + 10
        if seconds <= 200 {
            seconds += 10
            timerTextLabel.text = "\(seconds)"
        }
    }
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        timer.invalidate()
        timerTextLabel.text = "210"
    }
    
    
}

