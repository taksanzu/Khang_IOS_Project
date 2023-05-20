//
//  LevelViewController.swift
//  KhangGKSmartQuizz
//
//  Created by BVU on 5/20/23.
//

import UIKit

class LevelViewController: UIViewController {

    @IBOutlet weak var speedName: UILabel!
    @IBOutlet weak var totalQuestions: UILabel!
    @IBOutlet weak var totalTime: UILabel!
    @IBOutlet weak var timePerQuizz: UILabel!
    var speedMode: Level?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    func updateUI() {
        speedName.text = speedMode?.name.text
                if let totalQuestion = speedMode?.totalQuestions {
                    totalQuestions.text = totalQuestion
                }
                
                if let totalTimes = speedMode?.totalTime {
                    totalTime.text = totalTimes
                }
                
                if let timePerQuestion = speedMode?.timePerQuestion {
                    timePerQuizz.text = String(timePerQuestion)
                }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startGameSegue" {
            let questionViewController = segue.destination as! QuestionViewController
                    
            questionViewController.speedMode = self.speedMode
                    
            return
        }
    }
}
