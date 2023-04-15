//
//  ViewController.swift
//  AnimalSound
//
//  Created by BVU on 4/15/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var lbSound: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //Button Sound
    @IBAction func btnSound(_ sender: Any) {
        playSoundCat()
    }
    
    @IBAction func btnSoundDog(_ sender: Any) {
        playSoundDog()
    }
    @IBAction func btnSoundBonk(_ sender: Any) {
        playSoundBonk()
    }
    
    //Set func sound for each animal
    var player: AVAudioPlayer?
    func playSoundCat() {
        guard let path = Bundle.main.path(forResource: "Cat", ofType: "wav") else {
            return
        }
        let url = URL(fileURLWithPath: path)
        
        do{
            
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        }catch let error{
            print(error.localizedDescription)
        }
        lbSound.text = "Meow"
    }
    func playSoundDog() {
        guard let path = Bundle.main.path(forResource: "Dog", ofType: "mp3") else {
            return
        }
        let url = URL(fileURLWithPath: path)
        
        do{
            
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        }catch let error{
            print(error.localizedDescription)
        }
        lbSound.text = "AWW AWW"
    }
    func playSoundBonk() {
        guard let path = Bundle.main.path(forResource: "Bonk", ofType: "mp3") else {
            return
        }
        let url = URL(fileURLWithPath: path)
        
        do{
            
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        }catch let error{
            print(error.localizedDescription)
        }
        lbSound.text = "Bonk"
    }
    
}

