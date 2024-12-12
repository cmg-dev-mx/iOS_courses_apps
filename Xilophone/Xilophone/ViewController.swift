//
//  ViewController.swift
//  Xilophone
//
//  Created by Cesar Garduno on 12/11/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onClickButtonC(_ sender: UIButton) {
        let note = sender.titleLabel?.text ?? ""
        playAudio(note: note)
        toggleOpacity(sender: sender)
    }

    private func toggleOpacity(sender: UIButton) {
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1
        }
    }
    
    private func playAudio(note: String) {
        let url = Bundle.main.url(forResource: note, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
