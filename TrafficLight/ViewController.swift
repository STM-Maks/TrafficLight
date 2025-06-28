//
//  ViewController.swift
//  TrafficLight
//
//  Created by Maksims Stepanovs on 09/06/2025.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet var redLightView: UIView!
    @IBOutlet var yellowLightView: UIView!
    @IBOutlet var greenLightView: UIView!
    
    @IBOutlet var startButton: UIButton!
    
    private var light = CurrentLight.red
    private let lightIsOn = 1.0
    private let lightIsOff = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = 10
        
        redLightView.layer.cornerRadius = redLightView.frame.width / 2
        yellowLightView.layer.cornerRadius = yellowLightView.frame.width / 2
        greenLightView.layer.cornerRadius = greenLightView.frame.width / 2
        
        redLightView.alpha = lightIsOff
        yellowLightView.alpha = lightIsOff
        greenLightView.alpha = lightIsOff
    }

    @IBAction func tapStartButton() {
        if startButton.currentTitle == "Start" {
            startButton.setTitle("Next", for: .normal)
        }
        
        switch light {
        case .red:
            greenLightView.alpha = lightIsOff
            redLightView.alpha = lightIsOn
            light = .yellow
        case .yellow:
            redLightView.alpha = lightIsOff
            yellowLightView.alpha = lightIsOn
            light = .green
        case .green:
            yellowLightView.alpha = lightIsOff
            greenLightView.alpha = lightIsOn
            light = .red
        }
    }
    
}

// MARK: - CurrentLight
extension ViewController {
    private enum CurrentLight {
        case red
        case yellow
        case green
    }
}
