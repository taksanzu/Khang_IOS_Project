//
//  ViewController.swift
//  MyFirstApp
//
//  Created by BVU on 4/1/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txfName: UITextField!
    @IBOutlet weak var lbThitHeo: UILabel!
    @IBOutlet weak var btnSayHi: UIButton!
    var name = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func SayHi(_ sender: UIButton) {
        name = txfName.text!
        lbThitHeo.text = name
        lbThitHeo.textColor = UIColor.red
    }
}

