//
//  ViewController.swift
//  Egg Timer
//
//  Created by Cesar Garduno on 12/12/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var labelTimeRemaining: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft": 5, "Medium": 8, "Hard": 12] // time in minutes

    var selectedTime = 0 // in seconds
    var timer = Timer()
    var player: AVAudioPlayer!

    @IBAction func onclickButtonStopCounteer(_ sender: Any) {
        timer.invalidate()
        updateLabel("Cancelled")
        updateProgressBar(0)
        reproduceSound()
    }
    
    @IBAction func onClickHardnessSelected(_ sender: UIButton) {

        timer.invalidate()

        let hardness = sender.titleLabel?.text ?? "No title"
        let timeToCook = eggTimes[hardness] ?? 0

        selectedTime = timeToCook * 60 // convert to seconds
        var timeRemaining = selectedTime

        updateLabelTimeRemaining(timeRemaining: timeRemaining)
        updateProgressBar(1)

        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if timeRemaining > 0 {
                timeRemaining -= 1
                self.updateLabelTimeRemaining(timeRemaining: timeRemaining)
                self.updateProgressBar(Float(timeRemaining) / Float(self.selectedTime))
            } else {
                timer.invalidate()
                self.updateLabel("Done!")
                self.reproduceSound()
            }
        }
    }

    private func updateLabelTimeRemaining(timeRemaining: Int) {
        if timeRemaining > 60 {
            let minutes = timeRemaining / 60
            let seconds = timeRemaining % 60
            updateLabel("\(minutes) minutes and \(seconds) seconds")
        } else {
            updateLabel("\(timeRemaining) seconds")
        }
    }

    private func updateProgressBar(_ progress: Float) {
        progressBar.progress = progress
    }

    private func updateLabel(_ text: String) {
        labelTimeRemaining.text = text
    }
    
    private func reproduceSound() {
        let url = Bundle.main.url(forResource: "done", withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}

