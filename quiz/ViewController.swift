//
//  ViewController.swift
//  quiz
//
//  Created by itss on 25/11/19.
//  Copyright © 2019 itss. All rights reserved.
//

import UIKit




class ViewController: UIViewController {
  
    var currentQuestions = 0
    var score = 0
    var quizstated = false
    var myTimer : Timer!
    var secondSincestart = 0
    var minutesSinceStart = 0
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var contineLabel: UILabel!
    @IBOutlet weak var heart1: UIImageView!
    @IBOutlet weak var heart2: UIImageView!
    @IBOutlet weak var heart3: UIImageView!
    
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    @IBOutlet var tapGesture :UITapGestureRecognizer!
    
    
    var questionsSet = [question(questionStatement: "1.how many planets are there", firstChoice: "A.10", secoundChoice: "B.8", thridChoice: "C.7", forthChoice: "D.i don't know", correctChoice: .two, answeredCorrectly: false ),question(questionStatement: "2.what is the third planet from the sun ", firstChoice: "A.earth", secoundChoice: "B.mercury", thridChoice: "C.mars", forthChoice: "D.venus", correctChoice: .one, answeredCorrectly: false),question(questionStatement: "3.Which of these planets have the same name as the sea god", firstChoice: "A. jupiter", secoundChoice: "B.neptune", thridChoice: "C.pluto", forthChoice: "D.saturn", correctChoice: .two, answeredCorrectly: false),question(questionStatement: "4.Is the sun a star", firstChoice: "A.yes", secoundChoice: "B. No", thridChoice: "C.maybe", forthChoice: "D. I don’t know", correctChoice: .one, answeredCorrectly: false),question(questionStatement: "5.how many stars are there in the universe", firstChoice: "A.1", secoundChoice: "B.100000", thridChoice: "C.100000000000000", forthChoice: "D.unknown", correctChoice: .four, answeredCorrectly: false),question(questionStatement: "6.when was the solar system formed", firstChoice: "A.1950", secoundChoice: "B.5 million years", thridChoice: "C.50 million years", forthChoice: "D.4.6 billion years", correctChoice: .four, answeredCorrectly: false),question(questionStatement: "7.how big is the solar system", firstChoice: "A.75 million km", secoundChoice: "B.200 million km", thridChoice: "C.150 million km", forthChoice: "D.50 million km", correctChoice: .three, answeredCorrectly: false),question(questionStatement: "8.how many earths could fit in the sun", firstChoice: "A.10", secoundChoice: "B.100", thridChoice: "C.1 million", forthChoice: "D.100 million", correctChoice: .three, answeredCorrectly: false),question(questionStatement: "99.what is the hottest planet in  the solar system (excluding the sun)", firstChoice: "A.mercury", secoundChoice: "B.venus", thridChoice: "C.earth", forthChoice: "D.neptune", correctChoice: .two, answeredCorrectly: false),question(questionStatement: "10.how many rings does Saturn have?", firstChoice: "A.3", secoundChoice: "B.9", thridChoice: "C.7", forthChoice: "D.1", correctChoice: .one, answeredCorrectly: false)]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpQuestions()
        myTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        quizstated = true
        tapGesture.isEnabled = false
        contineLabel.isHidden=true
    }
    @IBAction func buttonA(_ sender: Any) {
        if questionsSet[currentQuestions].correctChoice == .one{
            buttonA.setTitle("\(questionsSet[currentQuestions].firstChoice) ☑️", for: .normal)
            score += 1
            questionsSet[currentQuestions].answeredCorrectly = true
             tapGesture.isEnabled = true
        }else{
            buttonA.setTitle("\(questionsSet[currentQuestions].firstChoice)❌", for: .normal)
        }
        disableButtonsAndContine()
    }
    @IBAction func buttonB(_ sender: Any) {
         if questionsSet[currentQuestions].correctChoice == .two{
                   buttonB.setTitle("\(questionsSet[currentQuestions].secoundChoice) ☑️", for: .normal)
                   score += 1
                   questionsSet[currentQuestions].answeredCorrectly = true
            tapGesture.isEnabled = true
               }else{
                   buttonB.setTitle("\(questionsSet[currentQuestions].secoundChoice)❌", for: .normal)
               }
        disableButtonsAndContine()
    }
    @IBAction func buttonC(_ sender: Any) {
         if questionsSet[currentQuestions].correctChoice == .three{
                   buttonC.setTitle("\(questionsSet[currentQuestions].thridChoice) ☑️", for: .normal)
                   score += 1
                   questionsSet[currentQuestions].answeredCorrectly = true
             tapGesture.isEnabled = true
               }else{
                   buttonC.setTitle("\(questionsSet[currentQuestions].thridChoice)❌", for: .normal)
               }
        disableButtonsAndContine()
    }
    @IBAction func buttonD(_ sender: Any) {
         if questionsSet[currentQuestions].correctChoice == .four{
                   buttonD.setTitle("\(questionsSet[currentQuestions].forthChoice) ☑️", for: .normal)
                   score += 1
                   questionsSet[currentQuestions].answeredCorrectly = true
             tapGesture.isEnabled = true
               }else{
                   buttonD.setTitle("\(questionsSet[currentQuestions].forthChoice)❌", for: .normal)
               }
       
        disableButtonsAndContine()
        
    }
    @IBAction func tapToContine(_ sender: Any) {
        if currentQuestions < questionsSet.count-1{
            currentQuestions+=1
            setUpQuestions()
        }
        else{
            buttonA.isEnabled = false
            buttonB.isEnabled = false
            buttonC.isEnabled = false
            buttonD.isEnabled = false
            buttonA.isHidden = true
            buttonB.isHidden = true
            buttonC.isHidden = true
            buttonD.isHidden = true
            quizstated = false
            questionLabel.text = "🌝score :\(score) time :\(minutesSinceStart) :\(secondSincestart)"
            
        }
    }
    
    
    
    func setUpQuestions(){
questionLabel.text = questionsSet[currentQuestions].questionStatement
buttonA.setTitle(questionsSet[currentQuestions].firstChoice, for: .normal)
buttonB.setTitle(questionsSet[currentQuestions].secoundChoice, for: .normal)
buttonC.setTitle(questionsSet[currentQuestions].thridChoice, for: .normal)
buttonD.setTitle(questionsSet[currentQuestions].forthChoice, for: .normal)
tapGesture.isEnabled = false
contineLabel.isEnabled = true
buttonA.isEnabled = true
buttonB.isEnabled = true
buttonC.isEnabled = true
buttonD.isEnabled = true
    }
    @objc func updateTimer(){
        if quizstated == true{
            secondSincestart+=1
        }else {
            secondSincestart+=0
        }
        if secondSincestart < 60{
            print(secondSincestart)
        }else{
            minutesSinceStart+=1
            secondSincestart = 0
        
            
        }
        
        timerLabel.text = " 🕐 \(minutesSinceStart):\(secondSincestart)"
        
        
        
    }
    func disableButtonsAndContine(){
        buttonA.isEnabled = false
        buttonB.isEnabled = false
        buttonC.isEnabled = false
        buttonD.isEnabled = false
        tapGesture.isEnabled = true
        contineLabel.isEnabled = false
        
    }
}

