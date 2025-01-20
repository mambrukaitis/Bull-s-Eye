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
    var targetValue:        Int = 0 //contains the randomly generated target valye
    var score:              Int = 0 //contains the total score
    var round:              Int = 0 //contains the current round number
    //Outlets
    @IBOutlet var slider:       UISlider!
    @IBOutlet var targetLabel:  UILabel!
    @IBOutlet var scoreLabel:   UILabel!
    @IBOutlet var roundLabel:   UILabel!
    
    //before the user sees the app
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderCurrentValue = lroundf(slider.value) //sets the slider positon at 50
        startOver()                                //preps all labels for a new round from nothing
        
        //Makes the slider pretty...
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(
            top: 0,
            left: 14,
            bottom: 0,
            right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }

    //processes user score and alerts the user
    @IBAction func showAlert() {
        //determines the number of points the user gained
        let difference: Int = abs(sliderCurrentValue - targetValue)
        var points:     Int = 100 - difference

        //sets feedback based on how good the shot was
        let feedback:   String
        switch points {
        case 1...60:
            feedback = "Check your eyes!"
            points -= 1
        case 61...90:
            feedback = "Keep practicing..."
        case 91...95:
            feedback = "Not too bad"
        case 96...98:
            feedback = "So close!"
            points += 25
        case 99:
            feedback = "One Off!"
            points += 51
        case 100:
            feedback = "Bull's Eye!"
            points += 100
        default:
            feedback = "Fatal Error"
        }
        score += points //adds points to the total score
        
        let message: String = "You scored \(points) points"
                    
        //alert to inform user of how well they did
        let alert = UIAlertController(
            title: feedback,
            message: message,
            preferredStyle: .alert)
        
        //alert action "Ok"
        let action = UIAlertAction(
            title: "Ok",
            style: .default,
            handler: { _ in
                self.startNewRound()
            })
        
        //actually presents the alert
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    //current value of the slider function
    @IBAction func sliderMoved(_ slider: UISlider) {
        sliderCurrentValue = lroundf(slider.value)
    }
        
    //creates a new random target, itterates the round, resets slider
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        sliderCurrentValue = 50
        slider.value = Float(sliderCurrentValue) //resets the slider position to 50
        round += 1
        updateLabels()
    }
    
    //updates the labels for: score, target, and round
    func updateLabels() {
        targetLabel.text = String(targetValue)  //sets the target label to the new random target
        scoreLabel.text = String(score)         //sets the score label to the total score
        roundLabel.text = String(round)         //sets the round number
    }
    
    //resets the score and round number, starts the game anew
    @IBAction func startOver() {
        score = 0
        round = 0
        startNewRound()
        //Adds a crossfade transition every time the game is restarted
        let transition = CATransition()
        transition.type = CATransitionType.fade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        view.layer.add(transition, forKey: nil)
    }
}

