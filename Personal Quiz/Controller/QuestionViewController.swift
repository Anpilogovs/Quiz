//
//  QuestionViewController.swift
//  Personal Quiz
//
//  Created by Сергей Анпилогов on 18.11.2022.
//

import UIKit

class QuestionViewController: UIViewController {
    
    //MARK: - IB Qutlest
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    @IBOutlet weak var multipleStackView: UIStackView!
    
    @IBOutlet var multipleLabels: [UILabel]!
    
    @IBOutlet var multipleSwitches: [UISwitch]!
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet var rangedLabel: [UILabel]!
    @IBOutlet weak var rangedSlider: UISlider!
    @IBOutlet weak var questionProgressView:
    UIProgressView!
    
    //MARK: - Private Properties
    private let questions = Question.getQuestions()
    private var questionIndex = 0
    private var answersChoosen: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateView()
    }
    
    //MARK - IB Actions
    
    @IBAction func singleAnswerButtonPreessed(_ sender: UIButton) {
        
        // currentsAnswers = array answers
        let currentsAnswers = questions[questionIndex].answers
        //currentsIndex = indexButton index when pressing
        guard let currentsIndex = singleButtons.firstIndex(of: sender) else { return }
        let currentAnswer = currentsAnswers[currentsIndex]
        //add answersChoosen = currentAnswer
        answersChoosen.append(currentAnswer)
        
        nextQuestion()
    }
    
    @IBAction func multipleAnswerButtonPressed() {
        
        let currentAnswers = questions[questionIndex].answers
        for(multipleSwitch, asnwer) in zip(multipleSwitches, currentAnswers) {
            if multipleSwitch.isOn {
                answersChoosen.append(asnwer)
            }
        }
        nextQuestion()
    }
    
    @IBAction func rangedAnswersButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        answersChoosen.append(currentAnswers[index])
        
        nextQuestion()
    }
    
    
    
// MARK: - Private Methods
    
    //Update user interface
    private func updateView() {
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden = true
        }
        //get current question
        let currentQuestion = questions[questionIndex]
        //set current question for question label
        questionLabel.text = currentQuestion.text
        // calculate progress
        let totalProgress = Float(questionIndex) / Float(questions.count)
        //set progress for question progress view
        questionProgressView.setProgress(totalProgress, animated: true)
        
        title = "Question № \(questionIndex + 1) from \(questions.count)"
        
        let currentsAnswers = currentQuestion.answers
        
        //Show stack view corresponding to question type
        switch currentQuestion.type {
        case .single:
            updateSingleStackView(using: currentsAnswers)
        case .multiple:
            updatedMultipleStackView(using: currentsAnswers)
        case .ranged:
            updatedRangedStackView(using: currentsAnswers)
        }
    }
    /// Setup single stack view
    /// - Parameter answers: array with answer
    private func updateSingleStackView(using answers: [Answer]) {
        //Show single stack view
        singleStackView.isHidden = false
        
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.text, for: .normal)
        }
    }
    /// Setup multiple stack view
    /// - Parameter answers: array with answers
    private func updatedMultipleStackView(using answers: [Answer]) {
        //Show multiple stack view
        multipleStackView.isHidden = false
        
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.text
        }
    }
    /// Setup ranged stack view
    /// - Parameter answers: array with answers
    private func updatedRangedStackView(using answers: [Answer]) {
        //Show ranged stack view
        rangedStackView.isHidden = false
        rangedLabel.first?.text = answers.first?.text
        rangedLabel.last?.text = answers.last?.text
    }
    
    //MARK: - Navigation
    
    //Show next question or go to the next screen
    private func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateView()
        } else {
            performSegue(withIdentifier: "resultSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier ==  "resultSegue" else { return }
        let resultVC = segue.destination as! ResultsViewController
        resultVC.responses = answersChoosen
    }
}
