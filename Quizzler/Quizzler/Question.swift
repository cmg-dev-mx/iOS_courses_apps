//
//  Question.swift
//  Quizzler
//
//  Created by Cesar Garduno on 12/17/24.
//

import Foundation

struct Question {
    let question: String
    let answer: Bool
    
    init(question: String, answer: Bool) {
        self.question = question
        self.answer = answer
    }
}
