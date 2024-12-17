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
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func onClickAnswer(_ sender: UIButton) {
        let userAnswer = sender.titleLabel?.text ?? "" == "True"
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        
        quizBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        progressBar.progress = quizBrain.getProgress()
        lblQuestion.text = quizBrain.getQuestionText()
        btnTrue.backgroundColor = .clear
        btnFalse.backgroundColor = .clear
    }
}
