//
//  ViewController.swift
//  Quizzler
//
//  Created by Cesar Garduno on 12/17/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var btnTrue: UIButton!
    @IBOutlet weak var btnFalse: UIButton!
    
    let quiz = [
        "Four + Two is equal to Six",
        "Five - Three is greater than One",
        "Three + Eight is less than Ten"
    ]
    
    var questionNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func onClickAnswer(_ sender: UIButton) {
        questionNumber = (questionNumber + 1) % quiz.count
        updateUI()
    }
    
    func updateUI() {
        lblQuestion.text = quiz[questionNumber]
    }
}

