//
//  ViewController.swift
//  MyFirstApp
//
//  Created by BVU on 4/1/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbThitCho: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lbThitCho.text = "Thịt heo"
        lbThitCho.textColor = UIColor.red
    }


}

