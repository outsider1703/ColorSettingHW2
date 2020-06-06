//
//  ViewController.swift
//  ColorSetting
//
//  Created by Macbook on 22.05.2020.
//  Copyright © 2020 Igor Simonov. All rights reserved.
//

import UIKit

//MARK: - Protocols
protocol ColorDataDelegate {
    func setColor(_ data: [String : Float])
}

class ColorSettingsViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet var viewSetColor: UIView!
    
    @IBOutlet var blueSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var redSlider: UISlider!
    
    @IBOutlet var valueBlueLabel: UILabel!
    @IBOutlet var valueGreenLabel: UILabel!
    @IBOutlet var valueRedLabel: UILabel!
    
    @IBOutlet var blueTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var redTextField: UITextField!
    
    
    //MARK: - Public properties
    var delegate: ColorDataDelegate!
    var redColor: Float!
    var greenColor: Float!
    var blueColor: Float!
    
    
    //MARK: - Privat properties
    private var dataColorValue: [String : Float]!
    
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parametersForSlider()
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        
        viewSetColor.layer.cornerRadius = 10
        
        setColor()
        valueColorLabel()
        setValueForTextFilds()
    }
    
    //MARK: - IB Actions
    @IBAction func setValueSlider() {
        setValueForTextFilds()
        valueColorLabel()
        setColor()
    }
    
    @IBAction func doneSettingColorButton() {
        delegate.setColor(dataColorValue)
        dismiss(animated: true)
    }
}


//MARK: - Private methods
extension ColorSettingsViewController {
    
    private func setColor() {
        viewSetColor.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                               green: CGFloat(greenSlider.value),
                                               blue: CGFloat(blueSlider.value),
                                               alpha: 1)
        
        dataColorValue = ["red" : redSlider.value,
                          "green" : greenSlider.value,
                          "blue" : blueSlider.value]
    }
    
    private func parametersForSlider() {
        redSlider.value = redColor
        greenSlider.value = greenColor
        blueSlider.value = blueColor
    }
    
    private func valueColorLabel() {
        valueRedLabel.text = String(format: "%.2f", redSlider.value)
        valueGreenLabel.text = String(format: "%.2f", greenSlider.value)
        valueBlueLabel.text = String(format: "%.2f", blueSlider.value)
    }
    
}

//MARK: - Work With Keyboard
extension ColorSettingsViewController: UITextFieldDelegate {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }

  
    
    private func setValueForTextFilds() {
        redTextField.text = String(format: "%.2f", redSlider.value)
        greenTextField.text = String(format: "%.2f", greenSlider.value)
        blueTextField.text = String(format: "%.2f", blueSlider.value)
    }

}
