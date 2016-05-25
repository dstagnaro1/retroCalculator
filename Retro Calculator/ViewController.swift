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
    }

    @IBAction func numberPressed(button: UIButton!){
        buttonSound.play()
        let tagValue = button.tag
        
        outputLabel.text = "\(tagValue)"
        
    }
    
}

