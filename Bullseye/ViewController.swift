//
//  ViewController.swift
//  Bullseye
//
//  Created by Victor Hugo on 12/31/18.
//  Copyright © 2018 Vintage Robot. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    var currentValue: Int = 0
    var targetValue: Int = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var Objetivo: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentValue = Int(slider.value)
        startNewRound()
    }

 
    @IBAction func showAlert()
    {
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        score += points
        
        let title: String
        
        if difference == 0
        {
            title = "Perfecto!, Ganaste 100 puntos adicionales"
            score += 100
           
        }
        else if difference < 5
        {
            title = "Casi le das!"
        }
        else if difference < 10
        {
            title = "Muy bien!"
        }
        else
        {
            title = "Muy lejos..."
        }
        
        let message = "Ganaste \(points) puntos"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Jugar de nuevo", style: .default, handler: {
            
            action in
            self.startNewRound()
        
        })

        alert.addAction(action)
        
        present(alert,animated: true, completion: nil)
        
        
    
    }
    
    @IBAction func sliderMoved(_ sender: UISlider)
    {
        print("The value of the Slider is now: \(sender.value)")
        let roundedValue = sender.value.rounded()
        print("The rounded value of the Slider is now: \(roundedValue)")
        currentValue = Int(sender.value)
    }
    
    func startNewRound()
    {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        
        updateLabels()
    }
    
    func updateLabels()
    {
        Objetivo.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    @IBAction func startNewGame(_ sender: UIButton)
    {
        score = 0
        round = 1
        updateLabels()
    }
}

