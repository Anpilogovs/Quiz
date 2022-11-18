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
    var answers: [Answer]
}

extension Question {
    static func getQuestions() -> [Question] {
        return [
            Question(text: "What do you like eat?",
                     type:
                    .single,
                     answers: [
                Answer(text: "Beff", type: .dog),
                Answer(text: "Fish", type: .cat),
                Answer(text: "carrots", type: .rabbit),
                Answer(text: "cabbage", type: .turtle)
            ]
                    ),
            Question(text: "What do you like more?", type:
                    .multiple,
                     answers: [
                Answer(text: "swim", type: .dog),
                Answer(text: "jumping", type: .cat),
                Answer(text: "run", type: .rabbit),
                Answer(text: "slow walk", type: .turtle)
            ]
                     ),
            Question(text: "What do you like drive?",
                     type:
                    .ranged,
                     answers: [
                Answer(text: "No", type: .dog),
                Answer(text: "Yes", type: .cat),
                Answer(text: "maybe", type: .rabbit),
                Answer(text: "i scary", type: .turtle)
            ]
                     )
        ]
    }
}
