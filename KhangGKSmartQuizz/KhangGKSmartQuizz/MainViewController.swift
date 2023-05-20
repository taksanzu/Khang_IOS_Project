//
//  ViewController.swift
//  KhangGKSmartQuizz
//
//  Created by BVU on 5/20/23.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "slow" {
                let levelViewController = segue.destination as! LevelViewController
                    
                let speedMode: Level = Level(
                    name: .SLOW,
                    totalQuestions: "10",
                    totalTime: "100",
                    timePerQuestion: 10
                )
                    
                levelViewController.speedMode = speedMode
                    
                return
            } else if segue.identifier == "normal" {
                let levelViewController = segue.destination as! LevelViewController
                    
                let speedMode: Level = Level(
                    name: .NORMAL,
                    totalQuestions: "10",
                    totalTime: "60",
                    timePerQuestion: 6
                )
                    
                levelViewController.speedMode = speedMode
                    
                return
            } else if segue.identifier == "fast" {
                let levelViewController = segue.destination as! LevelViewController
                    
                let speedMode: Level = Level(
                    name: .FAST,
                    totalQuestions: "10",
                    totalTime: "30",
                    timePerQuestion: 3
                )
                    
                levelViewController.speedMode = speedMode
                    
                return
            }
    }
    @IBAction func unwindToMain(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }
}

