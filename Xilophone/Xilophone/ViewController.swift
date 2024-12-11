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
    
    @IBAction func onClickButtonC(_ sender: Any) {
        playAudio(note: "C")
    }
    
    @IBAction func onClickButtonD(_ sender: Any) {
        playAudio(note: "D")
    }
    
    @IBAction func onClickButtonE(_ sender: Any) {
        playAudio(note: "E")
    }
    
    @IBAction func onClickButtonF(_ sender: Any) {
        playAudio(note: "F")
    }
    
    @IBAction func onClickButtonG(_ sender: Any) {
        playAudio(note: "G")
    }
    
    @IBAction func onClickButtonA(_ sender: Any) {
        playAudio(note: "A")
    }
    
    @IBAction func onClickButtonB(_ sender: Any) {
        playAudio(note: "B")
    }
    
    private func playAudio(note: String) {
        let url = Bundle.main.url(forResource: note, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
