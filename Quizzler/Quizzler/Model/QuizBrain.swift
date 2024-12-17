//
//  QuizBrain.swift
//  Quizzler
//
//  Created by Cesar Garduno on 12/17/24.
//

import Foundation

struct QuizBrain {
    
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
    var score: Int = 0
    
    mutating func checkAnswer(_ userAnswer: Bool) -> Bool {
        let isAnswerCorrect = quiz[questionNumber].answer == userAnswer
        if isAnswerCorrect {
            score += 1
        }
        return isAnswerCorrect
    }
    
    func getQuestionText() -> String {
        return quiz[questionNumber].question
    }
    
    func getScore() -> Int {
        return score
    }
    
    func getProgress() -> Float {
        return Float(questionNumber + 1) / Float(quiz.count)
    }
    
    mutating func nextQuestion() {
        if questionNumber + 1 == quiz.count {
            score = 0
        }
        questionNumber = (questionNumber + 1) % quiz.count
    }
}
