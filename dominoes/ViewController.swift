//
//  ViewController.swift
//  dominoes
//
//  Created by Earl J St Sauver on 11/22/14.
//  Copyright (c) 2014 Earl J St Sauver. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var players = ["Player 1", "Player 2"]
    var score = [0, 0]
    
    @IBOutlet weak var leftName: UITextField!
    @IBOutlet weak var rightName: UITextField!
    
    @IBOutlet weak var left0: HouseView!
    @IBOutlet weak var left1: HouseView!
    @IBOutlet weak var left2: HouseView!
    @IBOutlet weak var left3: HouseView!
    @IBOutlet weak var left4: HouseView!
 
    @IBOutlet weak var right0: HouseView!
    @IBOutlet weak var right1: HouseView!
    @IBOutlet weak var right2: HouseView!
    @IBOutlet weak var right3: HouseView!
    @IBOutlet weak var right4: HouseView!
    
    @IBOutlet var leftTapGesture: UITapGestureRecognizer!
    @IBOutlet var rightTapGesture: UITapGestureRecognizer!
    @IBAction func tapLeft(sender: UITapGestureRecognizer) {
        score[0] += 5
        rerenderScores()
        println(score[1])

    }
    
    @IBOutlet var leftSwipeGesture: UISwipeGestureRecognizer!
    @IBOutlet var rightSwipeGesture: UISwipeGestureRecognizer!
    
    
    @IBAction func swipePlayerOne(sender: AnyObject) {
        if score[0] >= 5 {
            score[0] -= 5
        } else {
            score[0] = 0
        }
        rerenderScores()
    }
    @IBAction func swipePlayerTwo(sender: AnyObject) {
        if score[1] >= 5 {
            score[1] -= 5
        } else {
            score[1] = 0
        }
        rerenderScores()
    }
    
    @IBAction func tapRight(sender: UITapGestureRecognizer) {
        score[1] += 5
        rerenderScores()
        
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func rerenderScores() {
        left0.score = houseScore(score[0], houseNum: 0)
        left1.score = houseScore(score[0], houseNum: 1)
        left2.score = houseScore(score[0], houseNum: 2)
        left3.score = houseScore(score[0], houseNum: 3)
        left4.score = houseScore(score[0], houseNum: 4)
        
        right0.score = houseScore(score[1], houseNum: 0)
        right1.score = houseScore(score[1], houseNum: 1)
        right2.score = houseScore(score[1], houseNum: 2)
        right3.score = houseScore(score[1], houseNum: 3)
        right4.score = houseScore(score[1], houseNum: 4)
        view.setNeedsDisplay()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        leftName.delegate = self
        rightName.delegate = self
        leftName.text = players[0]
        rightName.text = players[1]
        leftTapGesture.requireGestureRecognizerToFail(leftSwipeGesture)
        rightTapGesture.requireGestureRecognizerToFail(rightSwipeGesture)

        rerenderScores()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func houseScore(score:Int, houseNum:Int)-> Int {
        return max(min(score - houseNum * 50, 50), 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: NSSet, withEvent: UIEvent){
        view.endEditing(true)
    }
    
    


}

