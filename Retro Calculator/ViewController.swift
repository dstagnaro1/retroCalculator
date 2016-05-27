//
//  ViewController.swift
//  Retro Calculator
//
//  Created by Daniel Stagnaro on 5/23/16.
//  Copyright © 2016 Daniel Stagnaro. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    enum Operation: String {
        case Add = "+"
        case Subtract = "-"
        case Multiply = "*"
        case Divide = "/"
        case Empty = "Empty"
    }
    
    @IBOutlet weak var outputLabel: UILabel!
    
    var buttonSound: AVAudioPlayer!
    
    var runningSum = ""
    var leftValStr = ""
    var rightValStr = ""
    var currentOperation: Operation = Operation.Empty
    var result = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        let soundURL = NSURL(fileURLWithPath: path!)
        
        do {
            try buttonSound = AVAudioPlayer(contentsOfURL: soundURL)
            buttonSound.prepareToPlay()
        } catch let err as NSError{
            print(err.debugDescription)
        }
        
        outputLabel.text = "0"
    }

    @IBAction func numberPressed(button: UIButton!){
        playSound()
        
        runningSum += "\(button.tag)"
        outputLabel.text = runningSum
    }

    func playSound(){
        if buttonSound.playing {
            buttonSound.stop()
        }
        buttonSound.play()
    }
    
    @IBAction func onAddPressed(sender: UIButton) {
        processOperation(Operation.Add)
    }
    
    @IBAction func onSubtractPressed(sender: UIButton) {
        processOperation(Operation.Subtract)
    }
    
    @IBAction func onMultiplyPressed(sender: UIButton) {
        processOperation(Operation.Multiply)
    }
    
    @IBAction func onDividePressed(sender: UIButton) {
        processOperation(Operation.Divide)
    }
    
    @IBAction func onEqualPressed(sender: UIButton) {
        processOperation(currentOperation)
    }
    
    func processOperation(op: Operation){
        playSound()
        
        if currentOperation != Operation.Empty {
            // Run math here
            
            // The user selected an operator but then selected another operator
            // before selecting a number  
            if runningSum != "" {
                rightValStr = runningSum
                runningSum = ""
                
                if currentOperation == Operation.Add {
                    result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                } else if currentOperation == Operation.Subtract {
                    result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                } else if currentOperation == Operation.Multiply {
                    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                } else if currentOperation == Operation.Divide {
                    result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                }
                
                leftValStr = result
                outputLabel.text = result
            }
            
            currentOperation = op
            
        } else {
            // this is the first time an operator has been pressed
            leftValStr = runningSum
            runningSum = ""
            currentOperation = op
        }
    }
}


