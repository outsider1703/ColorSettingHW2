//
//  ViewController.swift
//  ColorSetting
//
//  Created by Macbook on 22.05.2020.
//  Copyright © 2020 Igor Simonov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var viewSetColor: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var nameRedLabel: UILabel!
    @IBOutlet var nameGreenLabel: UILabel!
    @IBOutlet var nameBlueLabel: UILabel!
    
    @IBOutlet var valueRedLabel: UILabel!
    @IBOutlet var valueGreenLabel: UILabel!
    @IBOutlet var valueBlueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parametersForLabels()
        parametersForSlider()
        viewSetColor.layer.cornerRadius = 10
    }
    
    @IBAction func setValueSlider() {
        viewSetColor.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                               green: CGFloat(greenSlider.value),
                                               blue: CGFloat(blueSlider.value),
                                               alpha: 1)
        
        valueRedLabel.text = String(format: "%.2f", redSlider.value)
        valueGreenLabel.text = String(format: "%.2f", greenSlider.value)
        valueBlueLabel.text = String(format: "%.2f", blueSlider.value)
        
    }
    
    private func parametersForLabels() {
        nameGreenLabel.text = "Green"
        nameBlueLabel.text = "Blue"
    }
    
    private func parametersForSlider() {
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        
        redSlider.value = 0.20
        greenSlider.value = 0.30
        blueSlider.value = 0.40
    }
}
