//
//  ViewController.swift
//  Created by Austin Garcia on 6/20/18.
//  Copyright © 2018 Austin Garcia. All rights reserved.

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    //showing the main screen when opening the app.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestion()
        
    }
    //checking to see if the user pressed true or false
    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
        pickedAnswer = true
    }
    else if sender.tag == 2 {
        pickedAnswer = false
    }
 
    checkAnswer()
    
    questionNumber = questionNumber + 1
        
    nextQuestion()
    
}   //updating the user interface.
    func updateUI() {
        
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber + 1) /13"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
     
        

    }
    
    //going to the next question.
    func nextQuestion() {
        if questionNumber <= 12 {
            
             questionLabel.text = allQuestions.list[questionNumber].questionText
            
             updateUI()
        }
        else {
            let alert = UIAlertController(title: "Awesome", message: "You've finished all the questions, do you want to start over?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler:
            { (UIAlertAction) in
                self.startOver()
            })
            alert.addAction(restartAction)
                present(alert, animated: true, completion: nil)
        }
    }

    
    //checking to see if the users answer is correct.
    func checkAnswer() {
        
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        if correctAnswer == pickedAnswer {
            
            ProgressHUD.showSuccess("Correct")
            
            score = score + 1
        }
        else {
            ProgressHUD.showError("Wrong!")
            
        }
    }
    
    //starting the quiz over.
    func startOver() {
        
        score = 0
        questionNumber = 0
        nextQuestion()
    }
    

    
}
