//
//  QuestionViewController.swift
//  KhangGKSmartQuizz
//
//  Created by BVU on 5/20/23.
//

import UIKit

class QuestionViewController: UIViewController {
    var questionBank: [Question] = [
            Question(text: "Ai đẹp trai nhất?", answers: ["Tiến", "Tâm", "Khôi", "Khang"],
                     result: 4, image: "😀"),
            Question(text:"Con này là gì?",answers: ["Chó", "Mèo", "Cua", "Dê"],
                     result: 2, image: "😀"),
            Question(text:"3+5",answers: ["12", "13", "9", "8"],
                     result: 4, image: "😀"),
            Question(text:"Đây là cái gì?",answers: ["Dép", "Áo", "Quần", "Nón"],
                     result: 1, image: "😀"),
            Question(text:"Tôi là ai?",answers: ["Mèo", "Bò", "Chó", "Heo"],
                     result: 3, image: "😀"),
            Question(text:"Đây là đâu?",answers: ["Hà Tĩnh", "Nghệ An", "Lâm Đồng", "Vũng Tàu"],
                     result: 4, image: "😀"),
            Question(text:"Chó là bạn, không phải ...",answers: ["Tôi", "Bạn", "Thằng kia", "Đồ ăn"],
                     result: 4, image: "😀"),
            Question(text:"Ai thông minh hơn học sinh lớp 5?",answers: ["Lớp 4", "Lớp 1", "Lớp 6", "Lớp 2"],
                     result: 3, image: "😀"),
            Question(text:"Tên thật của Khôi là gi?",answers: ["Tiến", "Tâm", "Khôi", "Sơn"],
                     result: 3, image: "😀"),
            Question(text:"Ai là người nhậu giỏi nhất?",answers: ["Khang", "Tâm", "Sơn", "Khôi"],
                     result: 1, image: "😀"),
            Question(text:"Trước số 47 là gi?",answers: ["AK", "13", "46", "D"],
                     result: 3, image: "😀"),
            Question(text:"Học đi đôi với?",answers: ["Hàng", "Hằng", "Hành", "Hoành"],
                     result: 3, image: "😀"),
            Question(text:"Bên trên tầng ...",answers: ["Trệt", "Lầu", "Thượng", "Nhà"],
                     result: 2, image: "😀"),
            Question(text:"Chị Đậu là ?",answers: ["Gà", "Nông dân", "Chủ nô", "CAi lệ"],
                     result: 2, image: "😀"),
            Question(text:"Ai đã đánh cắp nỏ của vua Hùng",answers: ["Ai Biết", "Mị Châu", "Thuỷ tinh", "Mị Nương"],
                     result: 2, image: "😀"),
            Question(text:"Trạng chết, chúa cũng ...",answers: ["Băng hà", "Đi Bar", "Ăn mừng", "Khóc"],
                     result: 1, image: "😀"),
        ]
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var answerLabel: UILabel!
    
    var currentQuestions: [Question] = []
       
    var currentQuestionIndex = 0
       
    var currentQuestionAnswer = 4
    
    var count:Int = 0
    var timer = Timer()
        
    var result : Result?
    
    var speedMode: Level?
    override func viewDidLoad() {
        super.viewDidLoad()
        let mode = speedMode?.name
        
        result = Result(levelType: mode, answeredQuestion: 0, rightQuestions: 0, rating: 0)
                
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                    target: self,
                                    selector: #selector(self.timerTick),
                                    userInfo: nil,
                                    repeats: true)
                
        get10Question()
                
        updateUI()
        
    }
    @objc func timerTick() {
        count += 1
        if let timePerQuestion = speedMode?.timePerQuestion {
                if count > timePerQuestion {
                    
                    nextQuestion()
                } else {
                        timerLabel.text = "\(count)"
                }
            }
        }
        
    func get10Question() {
            
        let countArray = questionBank.count
            
        var indexUsed: [Int] = []
            
        var countTimes = 10
            
        for _ in 1...countTimes {
            let index = Int.random(in: 1..<countArray)
            if indexUsed.contains(index) {
                countTimes+=1
            } else {
                currentQuestions.append(questionBank[index])
                indexUsed.append(index)
            }
        }
    }
    @IBAction func buttonAnswerPressed(_ sender: UIButton) {
        switch sender {
            case button1:
                currentQuestionAnswer = 0
                answerLabel.text = "Bạn chọn: " + currentQuestions[currentQuestionIndex].answers[currentQuestionAnswer]
                  
            case button2:
                currentQuestionAnswer = 1
                  
                answerLabel.text = "Bạn chọn: " + currentQuestions[currentQuestionIndex].answers[currentQuestionAnswer]
                
            case button3:
                currentQuestionAnswer = 2
               
                answerLabel.text = "Bạn chọn: " + currentQuestions[currentQuestionIndex].answers[currentQuestionAnswer]

            case button4:
                currentQuestionAnswer = 3
                  
                answerLabel.text = "Bạn chọn: " + currentQuestions[currentQuestionIndex].answers[currentQuestionAnswer]
            default:
                break
            }
                
            nextBtn.isEnabled = true
    }
    func resetAnswerTest() {
        button1.setTitle(currentQuestions[currentQuestionIndex].answers[0], for: .normal)
        button2.setTitle(currentQuestions[currentQuestionIndex].answers[1], for: .normal)
        button3.setTitle(currentQuestions[currentQuestionIndex].answers[2], for: .normal)
        button4.setTitle(currentQuestions[currentQuestionIndex].answers[3], for: .normal)
    }
    @IBAction func nextQuestion(_ sender: Any) {
        if currentQuestionAnswer != 4 {
                result?.answeredQuestion += 1
            }
            nextQuestion()
    }
    func checkAnswer() {
           if currentQuestionAnswer == currentQuestions[currentQuestionIndex].result {
               result?.rightQuestions += 1
           }
            currentQuestionAnswer = 4
       }
       
    func updateUI() {
        nextBtn.isEnabled = false
        let currentQuestion = currentQuestions[currentQuestionIndex]
           
           
        questionLabel.text = currentQuestion.text
        answerLabel.text = ""
           
        button1.setTitle(currentQuestion.answers[0], for: .normal)
        button2.setTitle(currentQuestion.answers[1], for: .normal)
        button3.setTitle(currentQuestion.answers[2], for: .normal)
        button4.setTitle(currentQuestion.answers[3], for: .normal)
       }
       
    func nextQuestion() {
        currentQuestionIndex += 1
        count = 0
           
        if currentQuestionIndex < currentQuestions.count {
            updateUI()
            checkAnswer()
        }
        else {
            timer.invalidate()
            performSegue(withIdentifier: "ResultSegue", sender: nil)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultSegue" {
            timer.invalidate()
            let resultViewController = segue.destination as! ResultViewController
                    
            resultViewController.result = self.result
                    
            return
        }
    }
}
