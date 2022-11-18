//
//  ResultsViewController.swift
//  Personal Quiz
//
//  Created by Сергей Анпилогов on 18.11.2022.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDescriptionLabel: UILabel!
    
    var responses: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateResult()

    }
    
    private func updateResult() {
        var frequencyOfAnimanls: [AnimalType: Int] = [:]
        let animals = self.responses.map { $0.type }
        
        for animal in animals {
            frequencyOfAnimanls[animal] = (frequencyOfAnimanls[animal] ?? 0) + 1
        }
        
        let sortedFrequencyOfAnimanls = frequencyOfAnimanls.sorted(by: { $0.value > $1.value})
        
        guard  let mostFrequensyAnimal = sortedFrequencyOfAnimanls.first?.key else { return }
    
        updateUI(with: mostFrequensyAnimal)
    }
    
    private func updateUI(with animal: AnimalType) {
        resultAnswerLabel.text = "You - \(animal.rawValue)"
        resultDescriptionLabel.text = "\(animal.definition)"
    }
    
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue)  {
        dismiss(animated: true)
    }
}
