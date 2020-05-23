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
    @IBOutlet var segmentControlForRed: UISegmentedControl!
    @IBOutlet var segmentControlForGreen: UISegmentedControl!
    @IBOutlet var segmentControkForBlue: UISegmentedControl!
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSetColor.layer.cornerRadius = 10
        setUpUISlider()
        setUpIUSegmentedControl()
    }

    @IBAction func redValueSetting() {
        segmentControlForRed.setTitle(String(format: "%.2f", redSlider.value), forSegmentAt: 1)
        viewSetColor.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                               green: CGFloat(greenSlider.value),
                                               blue: CGFloat(blueSlider.value),
                                               alpha: 1)
    }
    
    @IBAction func greenValueSetting() {
        segmentControlForGreen.setTitle(String(format: "%.2f", greenSlider.value), forSegmentAt: 1)
        viewSetColor.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                               green:  CGFloat(greenSlider.value),
                                               blue: CGFloat(blueSlider.value),
                                               alpha: 1)
    }
    
    @IBAction func blueValueSetting() {
        segmentControkForBlue.setTitle(String(format: "%.2f", blueSlider.value), forSegmentAt: 1)
        viewSetColor.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                               green:  CGFloat(greenSlider.value),
                                               blue: CGFloat(blueSlider.value),
                                               alpha: 1)
    }
    
    private func setUpUISlider() {
        
        redSlider.minimumTrackTintColor = .red
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        redSlider.value = 0.51
        
        greenSlider.minimumTrackTintColor = .green
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        greenSlider.value = 0.67
        
        blueSlider.minimumTrackTintColor = .blue
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        blueSlider.value = 0.35
    }
    
    private func setUpIUSegmentedControl() {
        
        segmentControlForRed.removeSegment(at: 0, animated: false)
        segmentControlForRed.insertSegment(withTitle: "Red", at: 0, animated: false)
        segmentControlForRed.setTitle(String(redSlider.value), forSegmentAt: 1)
        segmentControlForRed.isUserInteractionEnabled = false
        segmentControlForRed.backgroundColor = .gray
        segmentControlForRed.selectedSegmentTintColor = .red
        
        segmentControlForGreen.removeSegment(at: 0, animated: false)
        segmentControlForGreen.insertSegment(withTitle: "Green", at: 0, animated: false)
        segmentControlForGreen.setTitle(String(greenSlider.value), forSegmentAt: 1)
        segmentControlForGreen.isUserInteractionEnabled = false
        segmentControlForGreen.backgroundColor = .gray
        segmentControlForGreen.tintColor = .green
        
        segmentControkForBlue.removeSegment(at: 0, animated: false)
        segmentControkForBlue.insertSegment(withTitle: "Blue", at: 0, animated: false)
        segmentControkForBlue.setTitle(String(blueSlider.value), forSegmentAt: 1)
        segmentControkForBlue.isUserInteractionEnabled = false
        segmentControkForBlue.backgroundColor = .gray
        segmentControkForBlue.tintColor = .blue
    }
}

