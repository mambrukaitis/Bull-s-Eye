//
//  ViewController.swift
//  Ambrukaitis_COP2654_Mod1BullsEye
//
//  Created by Matas Ambrukaitis on 1/13/25.
//

import UIKit

class ViewController: UIViewController {

    //Variables
    var sliderCurrentValue: Int = 0 //contains the current position of the guessing slider
    var targetValue: Int = 0
    @IBOutlet var slider: UISlider!
    @IBOutlet var targetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderCurrentValue = lroundf(slider.value)
        startNewRound()
    }

    @IBAction func showAlert() {
        let message = "The value of the slider is: \(sliderCurrentValue)" +
                      "\nThe target value was: \(targetValue)"
                    
        
        let alert = UIAlertController(
            title: "Hello, World!",
            message: message,
            preferredStyle: .alert)
        
        
        let action = UIAlertAction(
            title: "Ok",
            style: .default,
            handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        startNewRound()
        
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        sliderCurrentValue = lroundf(slider.value)
    }
        
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        sliderCurrentValue = 50
        slider.value = Float(sliderCurrentValue) //resets the slider to 50
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
    }
    
}

