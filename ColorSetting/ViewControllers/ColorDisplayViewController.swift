//
//  ColorDisplayViewController.swift
//  ColorSetting
//
//  Created by Macbook on 05.06.2020.
//  Copyright © 2020 Igor Simonov. All rights reserved.
//

import UIKit

class ColorDisplayViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet var settingColorView: UIView!
    
    
    //MARK: - Privat properties
    private var red: Float = 0
    private var green: Float = 0
    private var blue: Float = 0
    
    
    //MARK: - Override Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let kazachekForVC = segue.destination as! ColorSettingsViewController
        kazachekForVC.delegate = self
        kazachekForVC.redColor = red
        kazachekForVC.greenColor = green
        kazachekForVC.blueColor = blue
    }
}


//MARK: - Extension
extension ColorDisplayViewController: ColorDataDelegate {
    
    func setColor(_ data: [String : Float]) {
        for (key, value) in data {
            switch key {
            case "red": red = value
            case "green": green = value
            case "blue": blue = value
            default:
                break
            }
        }
        settingColor()
    }
}

extension ColorDisplayViewController {
    
    private func  settingColor() {
        settingColorView.backgroundColor = UIColor(red: CGFloat(red),
                                                   green: CGFloat(green),
                                                   blue: CGFloat(blue),
                                                   alpha: 1)
    }
}
