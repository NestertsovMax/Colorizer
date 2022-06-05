//
//  ViewController.swift
//  colorizer
//
//  Created by M1 on 02.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var viewConroller: UIView!
    var timer: Timer?
    var isTimerStarted: Bool = false
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCounterLabel()
        
    }
    @objc func timerTickHandler() {
        if isTimerStarted == true, counter < 5 {
            counter += 1
            updateCounterLabel()
        } else {
            viewBackgroundStatic()
            counter = 0
            updateCounterLabel()
            stopTimer()
        }
    }

    @IBAction func buttonRed(_ sender: UIButton) {
        startTimer()
        viewConroller.backgroundColor = UIColor.red
        updateCounterLabel()
    }
    
    @IBAction func buttonBlue(_ sender: UIButton) {
        startTimer()
        viewConroller.backgroundColor = UIColor.blue
        updateCounterLabel()
    }
    
    @IBAction func buttonGreen(_ sender: UIButton) {
        startTimer()
        viewConroller.backgroundColor = UIColor.green
        updateCounterLabel()
    }
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerTickHandler), userInfo: nil, repeats: true)
        updateCounterLabel()
        isTimerStarted = true
    }
    func updateCounterLabel() {
        timerLabel.text = "\(counter)"
    }
    func viewBackgroundStatic() {
        viewConroller.backgroundColor = UIColor.lightGray
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
        counter = 0
        isTimerStarted = false
    }
}

