//
//  PinkViewController.swift
//  Segues And Navigation controller
//
//  Created by BVU on 4/22/23.
//

import UIKit

class PinkViewController: UIViewController {
    var counter = 0
    var timer = Timer()
    @IBOutlet weak var lbTimer: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @objc func timerTick() {
        counter += 1
        lbTimer.text = "\(counter)"
        if(counter == 30){
            timer.invalidate()
            counter = 0
            performSegue(withIdentifier: "PinkToYellow", sender: nil)
        }
    }
    @IBAction func gotoGreen(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(timerTick), userInfo: nil, repeats: true)
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
