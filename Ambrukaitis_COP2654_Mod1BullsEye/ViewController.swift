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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showAlert() {
        let message = "The value of the slider is \(sliderCurrentValue)"
        
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
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        sliderCurrentValue = lroundf(slider.value)
    }
        
        
}

