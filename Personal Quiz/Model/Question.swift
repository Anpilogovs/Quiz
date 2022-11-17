//
//  Question.swift
//  Personal Quiz
//
//  Created by Сергей Анпилогов on 17.11.2022.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answer: [Answer]
}

extension Question {
    static func getQuestions() -> [Question] {
        return [
            Question(text: "What do you like eat?", type: .single, answer: [
                Answer(text: "Beff", type: .dog),
                Answer(text: "Fish", type: .cat),
                Answer(text: "carrots", type: .rabbit),
                Answer(text: "cabbage", type: .turtle)
            ]
                    ),
            Question(text: "What do you like more?", type: .single, answer: [
                Answer(text: "swim", type: .dog),
                Answer(text: "jumping", type: .cat),
                Answer(text: "touches", type: .rabbit),
                Answer(text: "run", type: .turtle)
            ]
                     ),
            Question(text: "What do you like drive?", type: .single, answer: [
                Answer(text: "No", type: .dog),
                Answer(text: "Yes", type: .cat),
                Answer(text: "maybe", type: .rabbit),
                Answer(text: "i scary", type: .turtle)
            ]
                     )
        ]
    }
}
