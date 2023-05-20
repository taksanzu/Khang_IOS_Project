//
//  ResultViewController.swift
//  KhangGKSmartQuizz
//
//  Created by BVU on 5/20/23.
//

import UIKit

class ResultViewController: UIViewController {
    var result: Result?
    
    @IBOutlet weak var speedValue: UILabel!
    @IBOutlet weak var totalAnsweredQuestions: UILabel!
    @IBOutlet weak var totalRightAnswer: UILabel!
    @IBOutlet weak var ratingValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    func updateUI() {
        speedValue.text = result?.levelType?.text
        if let answeredQuestion = result?.answeredQuestion {
                totalAnsweredQuestions.text = String(answeredQuestion)
            }
                
        if let rightQuestions = result?.rightQuestions {
            totalRightAnswer.text = String(rightQuestions)
            ratingValue.text = String(calRating(rightAnswer: rightQuestions))
        }
    }
    func calRating(rightAnswer: Int) -> Int {
            var rating = 0
            if rightAnswer == 10 {
                rating = 5
            } else if rightAnswer >= 8 {
                rating = 4
            } else if rightAnswer >= 6 {
                    rating = 3
            } else if rightAnswer >= 4 {
                    rating = 2
            } else if rightAnswer == 3 {
                rating = 1
            } else if rightAnswer >= 1 {
                rating = 0
            }
            
        return rating
    }

}
