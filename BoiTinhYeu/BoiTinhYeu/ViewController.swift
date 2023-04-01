//
//  ViewController.swift
//  BoiTinhYeu
//
//  Created by BVU on 4/1/23.
//

import UIKit
extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var txtTenBan: UITextField!
    @IBOutlet weak var txtTenNY: UITextField!
    @IBOutlet weak var btnKiemTra: UIButton!
    @IBOutlet weak var lbKetQua: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func kiemTraHop(_ sender: Any) {
        switch kiemTraDiem {
        case 1:
            lbKetQua.text = "Xin chúc mừng"
        case 2:
            lbKetQua.text = "Chọn con tim hay là nghe lý trí"
        case 3:
            lbKetQua.text = "Một tình yêu trong sáng"
        case 4:
            lbKetQua.text = "Tình yêu như bát bún riêu"
        case 5:
            lbKetQua.text = "Chia tay"
        case 6:
            lbKetQua.text = "Ngồi khóc huhu"
        case 7:
            lbKetQua.text = "Ngon vl"
        case 8:
            lbKetQua.text = "Hay quá"
        case 9:
            lbKetQua.text = "T lười code quá"
            
        default:
            lbKetQua.text = "T lười code quá"
        }
    }
    var kiemTraDiem:Int{
        var tongDiem = 0
        var tongDiemT = 0
        let tongBanNY = String(KiemTraTong)
        if KiemTraTong > 9 {
            for i in tongBanNY {
                if let number = Int(String(i)) {
                    tongDiem += number
                }
            }
            while true {
                if tongDiem > 9 {
                    for x in String(tongDiem) {
                        if let numbers = Int(String(x)) {
                            tongDiemT += numbers
                        }
                    }
                    tongDiem = tongDiemT
            
                    tongDiemT = 0
                }else{
                    break
                }
            }
            return tongDiem
        }else{
            return KiemTraTong
        }
    }
    var KiemTraTong: Int{
        let tenBanName = txtTenBan.text!.lowercased()
        let tenNYName = txtTenNY.text!.lowercased()
        var tongBan = 0
        var tongNY = 0
        for i in 0..<tenBanName.count{
            switch String(tenBanName[i]) {
            case "a","k","u":
                tongBan = tongBan + 1
            case "b", "s", "j":
                tongBan = tongBan + 2
            case "c", "l", "t":
                tongBan = tongBan + 3
            case "d", "n", "x":
                tongBan = tongBan + 4
            case "e", "m", "w":
                tongBan = tongBan + 5
            case "f", "o", "v":
                tongBan = tongBan + 6
            case "g", "q", "z":
                tongBan = tongBan + 7
            case "h", "p", "y":
                tongBan = tongBan + 8
            case "i", "r":
                tongBan = tongBan + 9
            default:
                tongBan = tongBan + 0
            }
        }
        for i in 0..<tenNYName.count{
            switch String(tenNYName[i]) {
            case "a","k","u":
                tongNY = tongNY + 1
            case "b", "s", "j":
                tongNY = tongNY + 2
            case "c", "l", "t":
                tongNY = tongNY + 3
            case "d", "n", "x":
                tongNY = tongNY + 4
            case "e", "m", "w":
                tongNY = tongNY + 5
            case "f", "o", "v":
                tongNY = tongNY + 6
            case "g", "q", "z":
                tongNY = tongNY + 7
            case "h", "p", "y":
                tongNY = tongNY + 8
            case "i", "r":
                tongNY = tongNY + 9
            default:
                tongNY = tongNY + 0
            }
        }
        return tongBan + tongNY
    }
}


