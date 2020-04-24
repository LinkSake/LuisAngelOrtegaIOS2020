//
//  TimerViewController.swift
//  iOS2020
//
//  Created by Luis Angel Ortega on 23/04/20.
//  Copyright © 2020 Luis Angel Ortega. All rights reserved.
//

import UIKit
import SwiftySound

class TimerViewController: UIViewController {

    @IBOutlet weak var countdown: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    var seconds = 24
    var timer = Timer()
    var isTimerRunning = false
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        if isTimerRunning == false {
            runTimer()
            isTimerRunning = true
            startButton.setTitle("Stop", for: .normal)
        } else {
            timer.invalidate()
            isTimerRunning = false
            countdown.text = "\(seconds)."
            startButton.setTitle("Resume", for: .normal)
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        seconds = 24
        countdown.text = "\(seconds)."
        isTimerRunning = false
        startButton.setTitle("Start", for: .normal)
    }
    
    func runTimer() {
         timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(TimerViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if seconds < 1 {
            timer.invalidate()
            countdown.text = "\(seconds)."
            isTimerRunning = false
            startButton.setTitle("Start", for: .normal)
            Sound.play(file: "endgame.wav")
        } else {
            seconds -= 1
            countdown.text = "\(seconds)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
