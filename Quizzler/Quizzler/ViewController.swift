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
        Question(question: "A slug's blood is green", answer: true),
        Question(question: "Approximately one quarter of human bones are in the feet", answer: true),
        Question(question: "The total surface area of two human lungs is approximately 1 square meter", answer: false),
        Question(question: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat", answer: true),
        Question(question: "In London UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place", answer: false),
        Question(question: "It is illegal to pee in the Ocean in Portugal", answer: true),
        Question(question: "You can lead a cow down stairs but not up stairs", answer: false),
        Question(question: "Google was originally called 'Backrub'", answer: true),
        Question(question: "Buzz Aldrin's mother's maiden name was 'Moon'", answer: true),
        Question(question: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant", answer: false),
        Question(question: "No piece of square dry paper can be folded in half more than 7 times", answer: false),
        Question(question: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog", answer: true)
    ]
    
    var questionNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func onClickAnswer(_ sender: UIButton) {
        let userAnswer = sender.titleLabel?.text ?? "" == "True"
        let actualAnswer = quiz[questionNumber].answer
        
        if actualAnswer == userAnswer {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        
        questionNumber = (questionNumber + 1) % quiz.count
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        progressBar.progress = Float(questionNumber+1) / Float(quiz.count)
        lblQuestion.text = quiz[questionNumber].question
        btnTrue.backgroundColor = .clear
        btnFalse.backgroundColor = .clear
    }
}
