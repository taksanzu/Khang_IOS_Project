//
//  ViewController.swift
//  Xylophone
//
//  Created by BVU on 4/15/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //Button Sound
    
    @IBAction func btnDo(_ sender: Any) {
        playSound(sound: "Do")
    }
    @IBAction func btnRe(_ sender: Any) {
        playSound(sound: "Re")
    }
    @IBAction func btnMi(_ sender: Any) {
        playSound(sound: "Mi")
    }
    @IBAction func btnFa(_ sender: Any) {
        playSound(sound: "Fa")
    }
    @IBAction func btnSol(_ sender: Any) {
        playSound(sound: "Sol")
    }
    @IBAction func btnLa(_ sender: Any) {
        playSound(sound: "La")
    }
    @IBAction func btnSi(_ sender: Any) {
        playSound(sound: "Si")
    }
    //Sound func
    var player: AVAudioPlayer?
    func playSound(sound: String) {
        var path = ""
        switch sound {
        case "Do":
            path = Bundle.main.path(forResource: "note1", ofType: "wav")!
            break
        case "Re":
            path = Bundle.main.path(forResource: "note2", ofType: "wav")!
            break
        case "Mi":
            path = Bundle.main.path(forResource: "note3", ofType: "wav")!
            break
        case "Fa":
            path = Bundle.main.path(forResource: "note4", ofType: "wav")!
            break
        case "Sol":
            path = Bundle.main.path(forResource: "note5", ofType: "wav")!
            break
        case "La":
            path = Bundle.main.path(forResource: "note6", ofType: "wav")!
            break
        case "Si":
            path = Bundle.main.path(forResource: "note7", ofType: "wav")!
            break
        default:
            path = Bundle.main.path(forResource: "note1", ofType: "wav")!
        }
        let url = URL(fileURLWithPath: path)
        
        
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        }catch let error{
            print(error.localizedDescription)
        }
    }

}

