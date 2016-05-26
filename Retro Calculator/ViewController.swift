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

    @IBOutlet weak var outputLabel: UILabel!
    
    var buttonSound: AVAudioPlayer!
    
    var runningSum = ""
    var leftValStr = ""
    var rightValStr = ""
    
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
        
        outputLabel.text = ""
    }

    @IBAction func numberPressed(button: UIButton!){
        playSound()
        
        let tagValue = String(button.tag)
        let outputLabelText = outputLabel.text! + tagValue
        outputLabel.text = "\(outputLabelText)"
    }

    func playSound(){
        buttonSound.play()
    }
    
    @IBAction func onAddPressed(sender: UIButton) {
    }
    @IBAction func onSubtractPressed(sender: UIButton) {
    }
    @IBAction func onMultiplyPressed(sender: UIButton) {
    }
    @IBAction func onDividePressed(sender: UIButton) {
    }
    @IBAction func onEqualPressed(sender: UIButton) {
    }
        
}